struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

struct Combo {
    sa: S1;
    sb: S2;
    sc: S3;
    n: Int;
    f: Bool;
    t: String;
}

contract ComboFields {
    data: Combo;

    init() {
        self.data = Combo{
            sa: S1{ a: 1 },
            sb: S2{ b: true },
            sc: S3{ c: "hi" },
            n: 42,
            f: false,
            t: "bye",
        };
    }
}
