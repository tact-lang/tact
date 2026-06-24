struct OptStruct {
    innerOpt: Int?;
    flag: Bool;
}

contract OptStructContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            innerOpt: null,
            flag: true
        };
    }
}