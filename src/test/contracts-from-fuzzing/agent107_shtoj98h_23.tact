struct Foo {
    s: String;
}

struct Bar {
    foo: Foo;
    str: String;
}

contract TestContract {
    val: Bar;

    init() {
        self.val = Bar{
            foo: Foo{ s:"hi" },
            str: "bye"
        };
    }
}
