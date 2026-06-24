struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int?;
    y: InnerMost;
}

struct InnerMost {
    q: Bool?;
    z: String;
}

contract TestDeepNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: Inner{
                x: null,
                y: InnerMost{
                    q: true,
                    z: "hello"
                }
            }
        };
    }
}
