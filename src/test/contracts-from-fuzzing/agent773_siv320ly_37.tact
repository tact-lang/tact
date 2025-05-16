struct AggNestedOpt {
    o: NestedOpt?;
}

struct NestedOpt {
    val: Bool;
}

contract AggNestOpt {
    data: AggNestedOpt;

    init() {
        self.data = AggNestedOpt{
            o: null,
        };
    }
}