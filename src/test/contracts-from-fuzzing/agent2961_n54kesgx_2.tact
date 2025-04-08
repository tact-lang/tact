struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStruct {
    s: Inner;

    init() {
        self.s = Inner{ x: 7, y: true, z: "test" };
    }
}