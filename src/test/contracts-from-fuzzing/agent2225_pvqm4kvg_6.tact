struct IntAndString {
    intField: Int;
    strField: String;
}

contract MixedTypes {
    data: IntAndString;

    init() {
        self.data = IntAndString{
            intField: 123,
            strField: "hello"
        };
    }
}