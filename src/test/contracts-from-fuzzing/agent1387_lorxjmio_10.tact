struct OptionStruct {
    pr: Int?;
    flag: Bool?;
}

contract TestContract {
    state: OptionStruct;

    init() {
        self.state = OptionStruct{ pr: null, flag: null };
    }
}