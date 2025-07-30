struct Foo {
    v: Int;
}

contract TestContract {
    data: Foo;

    init() {
        self.data = Foo{ v: 123 };
    }

    receive() {
        let _ = self.data.v;
    }
}