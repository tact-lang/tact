struct Bar {
    a: Int as uint3 = 7;
    b: Int as int2 = -1;
}

struct Foo {
    bar: Bar;
    c: Int as int5 = 5;
}

contract NestedIntStructs {
    s: Foo;

    init() {
        self.s = Foo{
            bar: Bar{},
            c: 5
        };
    }
}