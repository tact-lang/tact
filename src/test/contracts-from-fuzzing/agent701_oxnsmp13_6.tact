struct MyStruct {
    a: Int;
    b: Bool;
}

contract MultiVarTest {
    foo: MyStruct;
    bar: Bool;
    baz: String;

    init() {
        self.foo = MyStruct{ a: 11, b: true };
        self.bar = false;
        self.baz = "hi";
    }
}