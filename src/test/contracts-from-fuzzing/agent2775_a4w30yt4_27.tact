struct MediumNested {
    val1: Int?;
    val2: Bool?;
}

struct OuterWrap {
    nested: MediumNested?;
}

contract OptionInOption {
    s: OuterWrap;

    init() {
        self.s = OuterWrap{
            nested: MediumNested{
                val1: null,
                val2: true
            }
        };
    }
}
