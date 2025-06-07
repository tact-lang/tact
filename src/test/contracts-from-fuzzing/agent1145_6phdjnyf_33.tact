struct IntFlagStruct {
    num: Int;
    flag: Bool;
}

contract IntFlagContract {
    data: IntFlagStruct;

    init() {
        self.data = IntFlagStruct{
            num: 0,
            flag: true
        };
    }
}
