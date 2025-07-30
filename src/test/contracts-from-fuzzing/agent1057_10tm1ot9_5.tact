struct InnerNested {
    value: Int;
    text: String?;
}

struct Outer {
    innerOpt: InnerNested?;
    innerVal: InnerNested;
}

contract OptStructContract {
    persistent: Outer;

    init() {
        self.persistent = Outer{
            innerOpt: null,
            innerVal: InnerNested{
                value: 99,
                text: null
            }
        };
    }
}