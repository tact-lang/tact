struct In1 { a: Int; }
struct In2 { b: Bool; }
struct In3 { c: String; }

struct Middle {
    s1: In1;
    s2: In2;
    s3: In3;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            s1: In1{ a: 4 },
            s2: In2{ b: true },
            s3: In3{ c: "yo" }
        };
    }
}