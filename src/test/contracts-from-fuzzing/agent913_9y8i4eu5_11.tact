struct Inner {
    i: Int;
    o: Bool?;
}

struct Middle {
    inner: Inner;
    s: String?;
}

contract TestContract {
    compound: Middle;
    init() {
        self.compound = Middle{
            inner: Inner{
                i: 10,
                o: null
            },
            s: "hello"
        };
    }
}