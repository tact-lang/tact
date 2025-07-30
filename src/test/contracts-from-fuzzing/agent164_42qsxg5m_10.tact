struct Boo {
    b: Bool;
}

struct Foo {
    sub: Boo;
}

contract OptionalNested {
    data: Foo?;

    init() {
        self.data = Foo{ sub: Boo{ b: false } };
    }
}