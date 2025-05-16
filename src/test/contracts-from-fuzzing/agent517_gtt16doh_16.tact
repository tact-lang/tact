struct SelfStruct {
    flag: Bool;
}

contract SelfCall {
    data: SelfStruct;

    init() {
        self.data = SelfStruct{
            flag: true
        };
    }

    get fun check(): Bool {
        return self.data.flag;
    }
}