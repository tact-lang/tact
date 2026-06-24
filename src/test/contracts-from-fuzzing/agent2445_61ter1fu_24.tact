message(41) A { a: Int }
message(42) B { b: Int }
message(43) C { c: Int }

struct Container {
    a: A?;
    b: B?;
    c: C?;
}

contract Foo {
    cont: Container;

    init() {
        self.cont = Container{
            a: null,
            b: B{ b: 2 },
            c: null,
        };
    }

    receive() {}
}