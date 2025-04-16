struct NestedOpt {
    d: Int?;
    e: Bool?;
}

struct WrapOpt {
    f: NestedOpt?;
    g: Address?;
}

contract TestContract {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            f: NestedOpt{
                d: 123,
                e: true
            },
            g: null
        };
    }
}