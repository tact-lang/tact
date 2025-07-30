struct OptStruct {
    field: Int?;
}

contract OptionalRootStructTest {
    rootOpt: OptStruct?;

    init() {
        self.rootOpt = null;
    }
}