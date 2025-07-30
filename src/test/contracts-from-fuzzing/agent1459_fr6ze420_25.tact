// deeply nested optional address with default null
struct Bar {
    addr: Address?;
}

struct Foo {
    bar: Bar?;
}

contract DeepAddrOpt {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}
