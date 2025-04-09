struct Coord3D {
    x: Int;
    y: Int;
    z: Int;
}

struct Box {
    p1: Coord3D;
    p2: Coord3D;
}

struct Scene {
    bbox: Box;
    description: String;
}

contract Complex3DNesting {
    scene: Scene;

    init() {
        self.scene = Scene{
            bbox: Box{
                p1: Coord3D{x:0,y:0,z:0},
                p2: Coord3D{x:1,y:1,z:1}
            },
            description: "box"
        };
    }
}