struct NestedStruct {
    x: Int;
    y: Int?;
    s: String;
}

contract WithNested {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ x: 5, y: null, s: "hello" };
    }
}