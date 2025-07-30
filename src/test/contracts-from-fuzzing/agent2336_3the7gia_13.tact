struct S {
    a: Int;
    b: Int?;
}

contract Foo {
    x: Int;
    y: Bool;
    z: S;

    init() {
        self.x = 42;
        self.y = false;
        self.z = S{ a: 100, b: null };
    }
}