struct S1 { a: Int; opt: Bool?; }
struct S2 { s: S1; txt: String; }
struct S3 { s: S2; num: Int; }
struct S4 { s: S3; extra: String?; }

contract DeepChain {
    data: S4;

    init() {
        self.data = S4{
            s: S3{
                s: S2{
                    s: S1{ a: 10, opt: true },
                    txt: "x",
                },
                num: 42,
            },
            extra: null,
        };
    }
}