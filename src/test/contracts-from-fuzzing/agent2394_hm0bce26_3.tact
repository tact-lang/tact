struct Inner {
    p: Int;
    q: Bool;
    r: String?;
}

struct Outer {
    inr: Inner;
    s: String;
    t: Bool?;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Inner{
                p: 42,
                q: true,
                r: null
            },
            s: "hi",
            t: null
        };
    }
}
