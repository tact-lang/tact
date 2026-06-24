struct NestedStringOpt {
    msg: String;
    optInner: InnerOpt?;
}

struct InnerOpt {
    label: String;
    extra: Bool?;
}

contract NestedStringTest {
    data: NestedStringOpt;

    init() {
        self.data = NestedStringOpt{
            msg: "hello",
            optInner: InnerOpt{
                label: "yo",
                extra: null
            }
        };
    }
}
