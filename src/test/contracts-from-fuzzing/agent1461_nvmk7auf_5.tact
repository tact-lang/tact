struct InnerInner {
    a: Bool?;
    b: String?;
}

struct Inner {
    x: Int?;
    y: InnerInner;
}

struct Wrapper {
    p: Inner?;
}

contract OptionalDeepNested {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            p: Inner{
                x: 42,
                y: InnerInner{
                    a: true,
                    b: "test"
                }
            }
        };
    }
}