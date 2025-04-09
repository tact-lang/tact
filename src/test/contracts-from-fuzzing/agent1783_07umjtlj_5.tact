struct Inner {
    a: Int?;
    b: Bool?;
}

struct Mid {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Mid;
    text: String;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: Inner{
                    a: null,
                    b: true,
                },
                flag: false,
            },
            text: "hi",
        };
    }

    receive() {
        let _ = self.data.mid.inner.a;
        let _ = self.data.mid.inner.b;
        let _ = self.data.mid.flag;
        let _ = self.data.text;
    }
}