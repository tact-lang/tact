struct Outer {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    f1: Int;
    f2: String?;
}

struct Inner2 {
    g1: Bool;
    g2: String;
}

contract MultiNested {
    val: Outer;

    init() {
        self.val = Outer{
            a: 11,
            b: Inner1{ f1: 1, f2: null },
            c: Inner2{ g1: true, g2: "hello" }
        };
    }
}