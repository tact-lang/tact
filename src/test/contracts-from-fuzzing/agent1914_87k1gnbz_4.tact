struct OptionStruct {
    val: Int?;
}

contract TestContract {
    st: OptionStruct;

    init() {
        self.st = OptionStruct{ val: null };
    }
}