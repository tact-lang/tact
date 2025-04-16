struct Foo {
    x: Int?;
}

struct Bar {
    y: Foo;
}

contract OptWrapStruct {
    z: Bar;

    init() {
        self.z = Bar { y: Foo{ x: null } };
    }
}