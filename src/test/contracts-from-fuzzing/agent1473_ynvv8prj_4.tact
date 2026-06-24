struct DeepOpt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    optStruct: DeepOpt;

    init() {
        self.optStruct = DeepOpt{a: null, b: true};
    }
}