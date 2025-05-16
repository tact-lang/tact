struct Foo {
    val: Int as int8;
    flag: Bool;
}

struct Bar {
    foo: Foo;
    x: Int as uint8;
}

contract SerializeNested {
    s: Bar;
    init() {
        self.s = Bar{
            foo: Foo{val:5,flag:true},
            x: 200
        };
    }
}