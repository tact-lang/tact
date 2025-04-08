struct BigNested {
    a: Int;
    b: String;
    c: DeepInner;
}

struct DeepInner {
    d: Int;
    e: String?;
    f: Bool;
}

contract TestBigNested {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 4,
            b: "hi",
            c: DeepInner{
                d: 5,
                e: null,
                f: true
            }
        };
    }
}