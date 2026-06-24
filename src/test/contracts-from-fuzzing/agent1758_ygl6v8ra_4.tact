struct OptionalNested {
    param: Int?;
    param2: Bool?;
}

contract OptStruct {
    st: OptionalNested;

    init() {
        self.st = OptionalNested{
            param: null,
            param2: true
        };
    }
}