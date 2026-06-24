struct SomeData {
    num: Int;
    flag: Bool;
    text: String;
}

contract NullableStruct {
    foo: SomeData?;

    init() {
        self.foo = null;
    }
}