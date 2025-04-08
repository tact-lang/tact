struct A {
    p1: Int;
    p2: Int?;
}

struct B {
    inner: A;
    q: Bool?;
}

contract MixedOptional {
    state: B;

    init() {
        self.state = B{
            inner: A{ p1: 123, p2: null },
            q: true
        };
    }
}