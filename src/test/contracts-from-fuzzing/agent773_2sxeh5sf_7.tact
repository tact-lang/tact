struct InnerMost {
    a: Int;
}

struct DeepOpt {
    inner: InnerMost?; // optional nested struct
    note: String;
}

contract OptionalNest {
    val: DeepOpt = DeepOpt {
        inner: null,
        note: "start"
    };

    init() {
        self.val = DeepOpt {
            inner: InnerMost{a: 5},
            note: "changed"
        };
    }

    receive() {}
}