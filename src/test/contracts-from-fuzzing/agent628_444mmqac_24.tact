struct JustBool {
    flag: Bool;
}

contract OnlyBoolStruct {
    data: JustBool;

    init() {
        self.data = JustBool{flag:true};
    }
}