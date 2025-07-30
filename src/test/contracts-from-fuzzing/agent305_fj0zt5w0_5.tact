struct OptionInner {
    optVal: Int?;
}

contract OptionalInStruct {
    val: OptionInner;

    init() {
        self.val = OptionInner{optVal: null};
    }
}