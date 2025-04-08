struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedFieldContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            x: 1,
            y: true,
            z: "abc",
        };
    }
}