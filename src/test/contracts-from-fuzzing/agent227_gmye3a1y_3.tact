struct OptStruct {
    maybeVal: Int?;
    flag: Bool;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{ maybeVal: null, flag: false };
    }
}