struct OptionStruct {
    val: Int?;
    text: String?;
    flag: Bool?;
}

contract TestContract {
    os: OptionStruct = OptionStruct{val: null, text: null, flag: null};

    init() {
        self.os = OptionStruct{val: null, text: null, flag: null};
    }

    receive() {
        dump(self.os.val);
        dump(self.os.text);
        dump(self.os.flag);
    }
}