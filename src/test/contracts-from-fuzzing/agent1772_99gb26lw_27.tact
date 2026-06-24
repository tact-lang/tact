struct BigNested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    a: Int?;
    b: Bool;
    c: String?;
}

contract Test27 {
    bn: BigNested;

    init() {
        self.bn = BigNested{
            inner1: Inner{
                a: null,
                b: false,
                c: null
            },
            inner2: Inner{
                a: 10,
                b: true,
                c: "yo"
            }
        };
    }
}