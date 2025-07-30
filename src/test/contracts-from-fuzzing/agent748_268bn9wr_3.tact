struct Data {
    flag: Bool;
    val: Int;
}

contract OptionalStructField {
    stuff: Data?;

    init() {
        self.stuff = Data{
            flag: true,
            val: 123,
        };
    }
}
