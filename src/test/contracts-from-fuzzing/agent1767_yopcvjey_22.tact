struct OptionStruct {
    inner: Int?;
    txt: String?;
    flag: Bool?;
}

contract OptionInit {
    s: OptionStruct;

    init() {
        self.s = OptionStruct{
            inner:null,
            txt:null,
            flag:true
        };
    }
}
