struct NestedStruct {
    foo: Int;
    bar: Bool;
    text: String;
}

contract StructAsField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ foo: 1, bar: true, text: "ok" };
    }
}