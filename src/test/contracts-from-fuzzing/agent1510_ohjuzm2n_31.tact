struct Foo {
    x: Int;
    y: Int;
}

contract TestContract {
    f: Foo;

    init() {
        let x = 5;
        let y = 7;
        self.f = Foo{x,y};
    }

    receive() {
        let _ = self.f;
    }
}