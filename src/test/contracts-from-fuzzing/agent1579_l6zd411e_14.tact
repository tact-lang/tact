struct OptNest {
    nested: Inner?;
    someText: String;
}

struct Inner {
    val: Int?;
}

contract OptionalDeep {
    data: OptNest;

    init() {
        self.data = OptNest{
            nested: null,
            someText: "hi"
        };
    }

    receive() {
        self.data.nested = Inner{val: 123};
    }
}