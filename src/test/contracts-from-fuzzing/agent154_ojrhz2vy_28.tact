struct AStruct {
    a: Int;
}

contract FlatAndNested {
    x: Int = 1;
    y: Bool = true;
    z: AStruct;

    init() {
        self.z = AStruct{ a: 42 };
    }
}