struct Inner {
    z: Int = 100;
}

struct Middle {
    y: Inner?; // optional nested struct
}

contract NestedOptional {
    foo: Middle;

    init() {
        self.foo = Middle{ y: Inner{ z: 777 } };
    }
}