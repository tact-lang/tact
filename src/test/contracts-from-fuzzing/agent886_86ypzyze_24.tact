struct InnerDeep {
    flag: Bool? = false;
    desc: String?;
}

struct MidDeep {
    detail: InnerDeep?;
    number: Int = 7;
}

struct OuterMost {
    core: MidDeep?;
    label: String = "label";
}

contract TestContract {
    payload: OuterMost;

    init() {
        self.payload = OuterMost{
            core: MidDeep{
                detail: InnerDeep{
                    flag: null,
                    desc: null
                },
                number: 42
            },
            label: "done"
        };
    }
}
