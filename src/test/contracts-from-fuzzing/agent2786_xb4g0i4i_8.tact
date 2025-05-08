struct Foo {
    x: Int;
    y: Int?;
    z: Int;
}

contract OptInMiddle {
    foo: Foo;
    init() {
        self.foo = Foo{ x:1, y:null, z:2 };
    }
}