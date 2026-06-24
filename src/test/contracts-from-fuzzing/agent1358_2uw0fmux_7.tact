struct S1 { a: Int; b: Bool; }
struct S2 { s1: S1; c: String; }
struct S3 { s2: S2; d: Address; }

contract ChainedNested {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{
                s1: S1{ a: 1, b: false },
                c: "hi"
            },
            d: myAddress()
        };
    }
}