package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha2d.Sprite;
import kha2d.Scene;
import kha.Assets;
import kha.input.Keyboard;
import kha.Key;

enum Directions {
		DOWN;
		LEFT;
		RIGHT;
		UP;
	}

class Project {
	var direction:Directions = null;
	var nodes: Array<Array<Node>> = [[]];
	var targetX:Int;
	var targetY:Int;
	var snakeX:Int;
	var snakeY:Int;
	var numNodesWidth:Int = 8;
	var numNodesHeight:Int = 8;
	var nodeSpriteWidth:Int = 64;
	var nodeSpriteHeight:Int = 64;
	var score = 1;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		var i;
		var j;
		
		for(i in 0...numNodesWidth)
		{
			nodes.push([]);
			for(j in 0...numNodesHeight)
			{
				nodes[i].push(new Node(Assets.images.black, nodeSpriteWidth, nodeSpriteHeight));
				nodes[i][j].x = i * nodeSpriteWidth;
				nodes[i][j].y = j * nodeSpriteHeight;
				Scene.the.addOther(nodes[i][j]);
			}
		}
		snakeX = 3;
		snakeY = 3;

		targetX = 6;
		targetY = 6;
		Keyboard.get().notify(keyDown,null);
		Scheduler.addTimeTask(turn, 0, 1);
	}

	function keyDown(key:Key, char:String)
	{
		trace(char);
		switch (key)
		{
			case LEFT: 
				direction = LEFT;
			case RIGHT: 
				direction = RIGHT;
			case UP: 
				direction = UP;
			case DOWN: 
				direction = DOWN;
			default:
				switch (char)
				{
					case 'a': 
						direction = LEFT;
					case 'd': 
						direction = RIGHT;
					case 'w': 
						direction = UP;
					case 's': 
						direction = DOWN;
				}
		}
		
	}
	function reset()
	{
		direction = null;		
		for(i in 0...numNodesWidth)
		{
			for(j in 0...numNodesHeight)
			{
				nodes[i][j].turnsSinceOccupied = -1;
				nodes[i][j].setImage(Assets.images.black);
			}
		}
		snakeX = 3;
		snakeY = 3;

		targetX = 6;
		targetY = 6;
		score = 1;
	}
	function turn()
	{
		var i;
		var j;
		if(direction == RIGHT)
		{
			snakeX++;
			if(snakeX == numNodesWidth || nodes[snakeX][snakeY].turnsSinceOccupied >= 0)
			{
				reset();
				return;
			}
		}
		else if(direction == LEFT)
		{
			snakeX--;
			if(snakeX < 0 || nodes[snakeX][snakeY].turnsSinceOccupied >= 0)
			{
				reset();
				return;
			}
		}
		else if(direction == UP)
		{
			snakeY--;
			if(snakeY < 0 || nodes[snakeX][snakeY].turnsSinceOccupied >= 0)
			{
				reset();
				return;
			}
		}
		else if(direction == DOWN)
		{
			snakeY++;
			if(snakeY == numNodesHeight || nodes[snakeX][snakeY].turnsSinceOccupied >= 0)
			{
				reset();
				return;
			}
		}
		nodes[snakeX][snakeY].turnsSinceOccupied = 0;
		for(i in 0...numNodesWidth)
		{
			for(j in 0...numNodesHeight)
			{
				
				if(nodes[i][j].turnsSinceOccupied != -1)
				{
					nodes[i][j].turnsSinceOccupied++;
				}
				if(nodes[i][j].turnsSinceOccupied > score)
				{
					nodes[i][j].setImage(Assets.images.black);
					nodes[i][j].turnsSinceOccupied = -1;
				}
				else if(i == targetX && j == targetY && targetX != snakeX && targetY != snakeY)
				{
					nodes[i][j].setImage(Assets.images.red);
				}
				else if(nodes[i][j].turnsSinceOccupied >= 0)
				{
					if(targetX == i && targetY == j)
					{
						score++;
						while(nodes[targetX][targetY].turnsSinceOccupied >= 0)
						{
							targetX = Math.floor(Math.random() * numNodesWidth);
							targetY = Math.floor(Math.random() * numNodesWidth);
						}
						nodes[targetX][targetY].setImage(Assets.images.red);
					}

					nodes[i][j].setImage(Assets.images.green);
				}
			}
		}
	}


	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {	
		var graphics = framebuffer.g2;
		graphics.begin();
		Scene.the.render(graphics);
		graphics.end();
	}
}
