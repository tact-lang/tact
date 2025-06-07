struct OptionInStruct {
    x: Int?;
    y: String;
}

contract OptionalInStructUsage {
    val: OptionInStruct;

    init() {
        self.val = OptionInStruct{ x:null, y:"yo" };
    }
}