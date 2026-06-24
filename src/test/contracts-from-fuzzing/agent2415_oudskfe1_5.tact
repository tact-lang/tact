struct S1 { i: Int; }
struct S2 { b: Bool; }
struct S3 { s: String; }

struct Combined {
    a: S1;
    b: S2;
    c: S3;
}

contract StructNest {
    combined: Combined;

    init() {
        self.combined = Combined{
            a: S1{i: 10},
            b: S2{b: false},
            c: S3{s: "hi"}
        };
    }
}