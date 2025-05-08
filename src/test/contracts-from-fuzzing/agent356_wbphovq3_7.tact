struct OptionStruct {
    inner: Int?;
}

contract OptionStructContract {
    myfield: OptionStruct;

    init() {
        self.myfield = OptionStruct{
            inner: null
        };
    }
}