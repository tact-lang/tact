// test that null optional default is fine in nested struct
struct Bar {
    x: Int = 1;
    y: String?; // default null
}

struct Foo {
    nested: Bar = Bar{};
    z: Bool = true;
}

contract TestContract {
    s: Foo = Foo{};

    init() {
        self.s = Foo{nested: Bar{x: 77, y: null}, z: false};
    }

    receive() {
        let _ = self.s.nested.x;
        let _ = self.s.nested.y;
        let _ = self.s.z;
    }
}