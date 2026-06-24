struct Data {
    id: Int;
    flag: Bool;
}

contract OptionalStructField {
    info: Data?;

    init() {
        self.info = Data{
            id: 5,
            flag: true,
        };
    }
}