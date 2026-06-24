struct OptionInStruct {
    info: String?;
    flag: Bool;
}

contract DefaultOptInit {
    val: OptionInStruct;

    init() {
        self.val = OptionInStruct{ info:null, flag:true };
    }
}