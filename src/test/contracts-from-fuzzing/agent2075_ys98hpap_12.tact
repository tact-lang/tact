struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Cell;
    s1: S1;
}

struct S3 {
    s2: S2;
    d: String;
    e: Bool;
}

contract MultiNest {
    hold: S3;

    init() {
        self.hold = S3{
            s2: S2{
                c: emptyCell(),
                s1: S1{ a: 5, b: true }
            },
            d: "hello",
            e: false
        };
    }
}