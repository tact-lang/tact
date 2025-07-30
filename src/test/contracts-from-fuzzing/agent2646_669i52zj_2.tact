struct NestedStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract NestedStorage {
    s: NestedStruct;
    init() {
        self.s = NestedStruct{foo: 11, bar: true, baz: "abc"};
    }
    receive() {}
}