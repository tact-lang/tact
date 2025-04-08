struct S1 { a: Int = 1; }
struct S2 { s: S1; b: Int?; }
struct S3 { k: S2; c: Bool; d: String?; }

contract ChainNested {
    st: S3;
    init() {
        self.st = S3{
            k: S2{
                s: S1{ a: 11 },
                b: 22
            },
            c: true,
            d: "abc"
        };
    }
}