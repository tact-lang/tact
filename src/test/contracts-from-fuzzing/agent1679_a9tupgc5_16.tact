struct NestedWidths {
    x: Int as uint4;
    y: Int as int5;
    z: Int as uint10;
}

contract NestedSerializationWidths {
    s: NestedWidths;

    init() {
        self.s = NestedWidths{ x: 0, y: 0, z: 0 };
    }

    receive() {}
}