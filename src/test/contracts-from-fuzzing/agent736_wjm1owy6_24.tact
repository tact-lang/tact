struct OptionInStruct {
    val: Int?;
}

contract TestContract {
    f1: OptionInStruct = OptionInStruct{val:null};
    f2: OptionInStruct? = null;

    init() {
        self.f1 = OptionInStruct{val:null};
        self.f2 = null;
    }

    receive() {
        dump(self.f2 == null);
    }
}