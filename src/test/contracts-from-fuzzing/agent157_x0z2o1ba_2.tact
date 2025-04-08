struct NestedStruct {
    x: Int;
    y: Int;
    z: Int;
}

contract StructAsField {
    obj: NestedStruct;

    init() {
        self.obj = NestedStruct{
            x: 10,
            y: 20,
            z: 30,
        };
    }
}