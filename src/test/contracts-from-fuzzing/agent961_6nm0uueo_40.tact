struct IntAndString {
    a: Int;
    b: String;
}

contract IntAndStringContract {
    data: IntAndString;

    init() {
        self.data = IntAndString {
            a: 5, b: "xyz"
        };
    }
}