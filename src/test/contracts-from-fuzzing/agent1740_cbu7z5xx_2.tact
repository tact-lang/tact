struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Inner;
    b: Bool;
}

contract NestContract {
    field: Outer;

    init() {
        self.field = Outer {
            a: Inner { x: 5, y: true },
            b: false
        };
    }
}