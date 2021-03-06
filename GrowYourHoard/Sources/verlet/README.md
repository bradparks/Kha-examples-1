# VerletKha
A simple Verlet (pronounced 'ver-ley') physics engine written in Haxe and Kha. Port of [verlet-js](http://subprotocol.com/system/introducing-verlet-js.html) with some references taken from [verlet-js-unity](https://github.com/Magd3v/verlet-js-unity)

![Forces](https://2.bp.blogspot.com/-mezknzkTRss/V1ReR93V9QI/AAAAAAAAB4s/BB3H4rbXi9UzXNc9sgI5vVKz9FQlMjkTACLcB/s320/forces.gif) ![Collision](https://1.bp.blogspot.com/-sZOCXiklNMA/VxXvK8lH5-I/AAAAAAAAB2o/6u0v4LKl5vwVSx9PfaqZMOi_H24XTrPJgCLcB/s320/CircleCollision.gif)

Particles, distance constraints, and angular constraints are all supported. From these primitives it is possible to construct just about anything you can imagine.

How to use
--------
Add to your Kha project's Libraries folder via cloning, adding as a submodule, or downloading directly. I usually go with 
```
git submodule add https://github.com/Devination/VerletKha.git Libraries/verlet/
``` 
Then when I need to update the submodule I'll use
```
git submodule foreach --recursive git checkout master && git submodule foreach --recursive git pull origin master
``` 
Documentation forthcoming. In the mean time, check out the Demos and their source code below.

Demos
--------
All demos and preview gifs can be found [here](http://www.devination.com/p/verletkha.html)

1. [Shapes (VerletKha Hello world)](http://www.devination.com/p/verletkha-shapes.html) - [Source Code](https://github.com/Devination/VerletKha-Examples/tree/master/Shapes)
2. [Primitive Colliders](http://www.devination.com/2016/04/verletkha-collision-primitives.html) - [Source Code](https://github.com/Devination/VerletKha-Examples/tree/master/Collision)
3. [Polygon Colliders](http://www.devination.com/2016/06/verletkha-polygon-colliders.html) - [Source Code](https://github.com/Devination/VerletKha-Examples/tree/master/PolygonCollision)
4. [Force Volumes](http://www.devination.com/2016/06/verletkha-forces.html) - [Source Code](https://github.com/Devination/VerletKha-Examples/tree/master/Forces)

TODO
-------
Check out the list on [Trello](https://trello.com/b/Uh63UCJi/verletkha)

License
-------
You may use VerletKha under the terms of the MPL 2.0 License (See [LICENSE](LICENSE)). Essentially, you can use commercially, combine with closed-source code, and distribute binaries but any changes made to the VerletKha files must be made open-source.
