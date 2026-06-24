struct Container {
    num: Int;
    txt: String?;
}

contract OptionalStructStorage {
    optionalField: Container?;

    init() {
        self.optionalField = Container{
            num: 7,
            txt: "hello",
        };
    }
}