struct InnerS {
    x: Int;
}

struct OuterS {
    foo: InnerS? = null;
    y: Int;
}

contract DefaultNestedOpt {
    val: OuterS;

    init() {
        self.val = OuterS {
            y: 42
        };
    }
}