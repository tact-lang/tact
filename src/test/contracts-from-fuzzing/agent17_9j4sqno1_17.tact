struct S1 { a: Int; }
struct S2 { b: Bool; }

struct S3 {
    s1opt: S1?;
    s2opt: S2?;
}

contract OptionalOfNested {
    s: S3;

    init() {
        self.s = S3{
            s1opt: S1{ a: 7 },
            s2opt: null,
        };
    }
}