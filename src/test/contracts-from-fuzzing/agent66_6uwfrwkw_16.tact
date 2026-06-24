struct OptionalStruct {
    test: Int?;
}

contract InitDefaultOpt {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            test: null
        };
    }
}