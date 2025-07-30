struct OptionWrap {
    inner: Int?;
}

struct OuterOptWrap {
    wrap: OptionWrap;
}

contract NestedOptionStruct {
    opt: OuterOptWrap;

    init() {
        self.opt = OuterOptWrap{
            wrap: OptionWrap{ inner: null }
        };
    }
}