struct S1 { a: Int; }
struct S2 { s: S1; b: Bool; }
struct S3 { s: S2; c: String; }

contract NestedLevels {
    data: S3;
    init() {
        self.data = S3{
            s: S2{
                s: S1{ a: 1 },
                b: true,
            },
            c: "ok",
        };
    }
}