struct Sub {
    a: Int;
    b: Bool;
}

struct Wrap1 {
    x: Int;
    sub: Sub;
}

struct Wrap2 {
    a: Sub;
    b: Wrap1;
    c: String;
}

struct Top {
    q: Wrap2;
    r: Bool;
}

contract TestContract {
    field: Top;

    init() {
        self.field = Top{
            q: Wrap2{
                a: Sub{a: 1, b: true},
                b: Wrap1{ x: 7, sub: Sub{a: 2, b: false} },
                c: "ok"
            },
            r: true
        };
    }
}