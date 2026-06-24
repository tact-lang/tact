struct DataContainer {
    str: String;
    num: Int;
    flag: Bool;
}

contract OptionalNested {
    value: DataContainer?;
    init() {
        self.value = null;
    }
}