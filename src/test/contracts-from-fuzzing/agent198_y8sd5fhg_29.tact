struct A { x: Int }

struct B {
    a: A?;
    b: Int;
    c: String?;
}

contract MixNestedOpt {
    f: B;

    init() {
        self.f = B{
            a: null,
            b: 42,
            c: null
        };
    }
}
