struct AA {
    aaa: Int?;
    bbb: Int;
}

contract OptionFieldBeforeConcrete {
    f: AA;

    init() {
        self.f = AA{aaa:null, bbb:5};
    }
}