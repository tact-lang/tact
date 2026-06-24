struct A {
    x: Int;
    y: Bool?;
}

struct B {
    nested: A;
    z: Int?;
}

contract OptionalNest {
    s: B;

    init() {
        self.s = B{
            nested: A{
                x: 1,
                y: null
            },
            z: null
        };
    }
}