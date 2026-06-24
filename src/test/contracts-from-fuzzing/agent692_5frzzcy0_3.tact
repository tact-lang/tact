struct OptStruct {
    maybeInt: Int?;
    maybeStr: String?;
    maybeBool: Bool?;
}

contract TestContract {
    optional: OptStruct;

    init() {
        self.optional = OptStruct{
            maybeInt: null,
            maybeStr: null,
            maybeBool: null,
        };
    }
}