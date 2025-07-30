struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Int;
    z: Bool;
}

struct Outer {
    left: Inner1;
    right: Inner2;
}

contract ComplexNested {
    foo: Outer;

    init() {
        self.foo = Outer{
            left: Inner1{ x:7 },
            right: Inner2{ y:3, z:false },
        };
    }
}