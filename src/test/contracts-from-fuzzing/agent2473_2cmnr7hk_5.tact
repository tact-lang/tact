struct Data {
    val: Int = 5;
    text: String = "hello";
}

contract OptionalStructField {
    info: Data?;  // optional struct type persistent field

    init() {
        self.info = null;  // explicitly set to null
    }
}
