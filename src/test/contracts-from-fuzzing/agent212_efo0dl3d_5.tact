struct Foo {
    a: Int;
    b: String;
    c: Int?;
}

struct Bar {
    x: Bool;
    y: Address;
    z: Foo?;
}

contract TestContract {
    st1: Foo?;
    st2: Bar?;

    init() {
        self.st1 = Foo{ a: 1, b: "abc", c: null };
        self.st2 = Bar{ x: true, y: myAddress(), z: null };
    }
}