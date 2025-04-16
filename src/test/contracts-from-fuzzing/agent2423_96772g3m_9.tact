struct SomeData {
    number: Int;
    flag: Bool;
}

contract OptionInPersistent {
    field: SomeData?;

    init() {
        self.field = null;
    }
}