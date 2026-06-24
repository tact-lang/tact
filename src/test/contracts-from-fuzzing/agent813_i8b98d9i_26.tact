struct Boo {
    bar: Bool;
}

struct Foo {
    nest: Boo;
}

struct Wrap {
    foo: Foo;
}

contract NestedWrap {
    val: Wrap;

    init() {
        self.val = Wrap{ foo: Foo{ nest: Boo{ bar: true } } };
    }
}