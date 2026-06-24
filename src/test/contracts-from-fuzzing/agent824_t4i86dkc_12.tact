struct OptInStruct {
    innerOpt: Int?;
}

contract TestContract {
    testOpt: OptInStruct?;

    init() {
        self.testOpt = OptInStruct{innerOpt: 42};
    }
}