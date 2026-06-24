struct DeepNested {
    x: Int;
    y: Inner;
}

struct Inner {
    s: String;
    z: Bool;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            x: 1,
            y: Inner{
                s: "hi",
                z: true,
            },
        };
    }
}
