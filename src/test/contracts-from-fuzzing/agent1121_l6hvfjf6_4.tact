struct Data {
    val: Int?;
}

contract OptionalStructField {
    data: Data;

    init() {
        self.data = Data{val: null};
    }
}