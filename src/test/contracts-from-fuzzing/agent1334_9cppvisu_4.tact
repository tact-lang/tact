struct A {
    x: Int;
    y: Bool?;
    z: String;
}

struct B {
    m: Int;
    n: A?;
}

contract OptNest {
    data: B;

    init() {
        self.data = B{
            m: 10,
            n: null
        };
    }
}
