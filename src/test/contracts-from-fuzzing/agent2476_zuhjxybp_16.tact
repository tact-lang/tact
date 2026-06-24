struct SomeData {
    intf: Int;
}

contract NullStructField {
    data: SomeData?;
    init() {
        self.data = null;
    }
}