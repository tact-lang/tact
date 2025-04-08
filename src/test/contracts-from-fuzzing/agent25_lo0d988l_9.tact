struct OptionStruct {
    text: String?;
}

contract TestContract {
    optStruct: OptionStruct?;

    init() {
        self.optStruct = null;
    }
}