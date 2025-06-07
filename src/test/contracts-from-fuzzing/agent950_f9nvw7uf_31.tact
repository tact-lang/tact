// nested optional struct in trait inherited contract
trait TT {
    foo: Foo?;
}

struct Foo {
    x: Int?;
    y: Bool?;
}

contract TTImpl with TT {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}