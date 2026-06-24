struct S1 { a: Int }
struct S2 { b: Bool; c: S1 }
struct S3 { d: String; e: S2 }

contract Test9 {
    s: S3;

    init() {
        self.s = S3{
            d: "nested mix",
            e: S2{
                b: false,
                c: S1{a: 100}
            }
        };
    }
}