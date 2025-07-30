struct OptionStruct {
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract TestContract {
    opt: OptionStruct;

    init() {
        self.opt = OptionStruct{maybeInt: null, maybeBool: true};
    }
}