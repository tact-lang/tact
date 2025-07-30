struct Middle {
    a: Int;
    nested: InnerOptionalOpt;
}

struct InnerOptionalOpt {
    optInner: OptionalInner?;
}

struct OptionalInner {
    val: Int;
    flag: Bool;
    text: String;
}

contract TestContract {
    val: Middle;

    init() {
        self.val = Middle{
            a: 99,
            nested: InnerOptionalOpt{
                optInner: null
            }
        };
    }
}
