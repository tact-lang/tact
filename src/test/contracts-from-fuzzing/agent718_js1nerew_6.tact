struct OptionalsInDepth {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Slice?;
    f6: Address?;
    f7: OptionInner?;
}

struct OptionInner {
    value: Int;
    text: String;
}

contract TestContract {
    data: OptionalsInDepth;

    init() {
        self.data = OptionalsInDepth{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
            f7: OptionInner{
                value: 10,
                text: "hello"
            }
        };
    }
}