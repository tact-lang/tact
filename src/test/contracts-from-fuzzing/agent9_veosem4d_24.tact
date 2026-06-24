struct OptionInStruct {
    x: Int?;
    y: Bool?;
}

struct WrapOption {
    inner: OptionInStruct;
}

contract OptionInsideWrapper {
    field: WrapOption;
    init() {
        self.field = WrapOption{
            inner: OptionInStruct{ x:null, y:null }
        };
    }
}