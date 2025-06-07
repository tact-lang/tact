struct OptStruct {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
}

contract OptionalStructStorage {
    myOpt: OptStruct?;
    init() {
        self.myOpt = null;
    }
}