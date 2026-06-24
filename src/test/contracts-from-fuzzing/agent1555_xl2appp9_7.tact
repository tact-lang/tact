struct HasString {
    strField: String;
    intField: Int;
}

contract StringStructStorage {
    data: HasString;

    init() {
        self.data = HasString{
            strField: "hello",
            intField: 100
        };
    }
}
