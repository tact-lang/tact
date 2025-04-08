struct Inner {
    a: Int?;
    b: Bool?;
}

struct Middle {
    inner: Inner;
    c: String;
}

contract MidOpt {
    mid: Middle?;

    init() {
        self.mid = Middle{
            inner: Inner{
                a: null,
                b: true,
            },
            c: "hi",
        };
    }
}