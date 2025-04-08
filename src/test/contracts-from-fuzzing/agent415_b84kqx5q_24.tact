struct A {
    x: Int;
    y: Bool;
}

struct B {
    s: A;
    z: Int?;
}

contract UseB {
    f: B;

    init() {
        self.f = B{
            s: A{x: 10, y: false},
            z: null
        };
    }
}