struct Foo {
    a: Int?;
    b: String?;
    c: Bool;
    d: Bool?;
    e: String;
}

struct Bar {
    foo: Foo;
    val: Int;
    note: String?;
}

contract OptionalsInNestedStruct {
    inner: Bar;

    init() {
        self.inner = Bar{
            foo: Foo{ a:null, b:null, c:true, d:null, e:"def" },
            val: 123,
            note: null
        };
    }
}