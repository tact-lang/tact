struct DeeplyNested {
    coord: Point3D;
}

struct Point3D {
    x: Int;
    y: Int;
    z: Int;
}

contract NestedStructStorage {
    deep: DeeplyNested;
    
    init() {
        self.deep = DeeplyNested{
            coord: Point3D{ x: 1, y: 2, z: 3 }
        };
    }
}