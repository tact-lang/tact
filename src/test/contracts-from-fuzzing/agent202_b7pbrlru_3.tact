struct DeepNested {
    pt: Point;
    z: Int;
}

struct Point {
    x: Int;
    y: Int;
}

contract NestedStructs {
    deep: DeepNested;
    init() {
        self.deep = DeepNested{
            pt: Point{ x: 3, y: 4 },
            z: 5
        };
    }
    receive() {
        let _ = self.deep.pt.x + self.deep.pt.y + self.deep.z;
    }
}