struct X {
    foo: Int = 1;
    bar: Bool;
}

struct Y {
    baz: X;
    qux: Bool = false;
}

contract Weird {
    y: Y;
    init() {
        self.y = Y{ baz: X{ foo: 1, bar: true }, qux: false };
    }
}