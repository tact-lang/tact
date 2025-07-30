struct InnerOption {
    val: Int?;
}

struct OptionInStruct {
    nested: InnerOption;
}

contract OptionStructTest {
    data: OptionInStruct;

    init() {
        self.data = OptionInStruct{
            nested: InnerOption{ val: null }
        };
    }
}