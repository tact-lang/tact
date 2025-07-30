struct BigNested {
    a: Int;
    b: Int?;
    c: Inner1;
    d: Inner2;
}

struct Inner1 {
    x: Int;
    y: Int?;
}

struct Inner2 {
    z: Inner3;
}

struct Inner3 {
    u: Int;
    v: Int?;
    w: Inner4;
}

struct Inner4 {
    k: Int;
}

contract Test {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: null,
            c: Inner1{ x: 2, y: null },
            d: Inner2{ z: Inner3{ u: 3, v: null, w: Inner4{ k: 4 } } }
        };
    }
}