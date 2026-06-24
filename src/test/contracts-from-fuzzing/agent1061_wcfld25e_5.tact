struct DeepOpt {
    field1: Int;
    optionalInner: Inner?;
}

struct Inner {
    val: Int;
    label: String;
}

contract Test {
    nestedOpt: DeepOpt;

    init() {
        self.nestedOpt = DeepOpt{
            field1: 7,
            optionalInner: Inner{ val: 1, label: "x" }
        };
    }
}