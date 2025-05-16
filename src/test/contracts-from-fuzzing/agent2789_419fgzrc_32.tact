struct OptionWrap {
    foo: Int?;
    bar: Bool?;
}

contract MultipleOptionalWraps {
    ow1: OptionWrap;
    ow2: OptionWrap;
    ow3: OptionWrap;

    init() {
        self.ow1 = OptionWrap{ foo:null, bar:null };
        self.ow2 = OptionWrap{ foo:5, bar:true };
        self.ow3 = OptionWrap{ foo:null, bar:false };
    }
}
