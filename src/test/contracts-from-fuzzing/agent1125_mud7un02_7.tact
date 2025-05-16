struct OptionInNested {
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
}

contract TestContract {
    f: OptionInNested;

    init() {
        self.f = OptionInNested{
            inner: InnerOpt{
                val: null,
            },
        };
    }
}