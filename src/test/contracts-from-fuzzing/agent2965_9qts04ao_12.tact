struct OptInNested {
    nestOpt: NestedOpt?;
}

struct NestedOpt {
    val: Int;
    optInner: InnerMost?;
}

struct InnerMost {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: OptInNested;

    init() {
        self.data = OptInNested{
            nestOpt: NestedOpt{
                val: 42,
                optInner: null
            }
        };
    }
}
