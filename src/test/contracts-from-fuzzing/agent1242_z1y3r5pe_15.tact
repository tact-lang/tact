struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    z: String;
}

contract Test {
    b: B;

    init() {
        self.b = B{
            a: A{ x: 99, y: true },
            z: "hey",
        };
    }
}
