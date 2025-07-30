struct DeepNested {
    foo: Foo?;
    count: Int;
}

struct Foo {
    x: Int;
    flag: Bool;
}

contract TestContract {
    d: DeepNested;

    init() {
        self.d = DeepNested{ foo: Foo{ x: 1, flag: true }, count: 42 };
    }
}