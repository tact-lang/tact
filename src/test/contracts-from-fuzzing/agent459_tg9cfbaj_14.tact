struct DeepOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrap {
    inner: DeepOpts?;
    marker: Bool;
}

contract NestedOptionalLayer {
    state: Wrap = Wrap{ inner: null, marker: true };

    init() {
        self.state = Wrap{
            inner: DeepOpts{ a: 1, b: null, c: "hi" },
            marker: false
        };
    }
}