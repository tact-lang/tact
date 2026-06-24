struct TestStruct {
    a: Int;
    b: Bool;
}

contract X {
    foo: Int;
    bar: TestStruct;
    baz: Bool;

    init() {
        self.foo = 10;
        self.bar = TestStruct{a:1, b:true};
        self.baz = false;
    }
}