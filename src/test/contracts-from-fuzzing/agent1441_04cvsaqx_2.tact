struct Nested {
    flag: Bool;
    num: Int;
    text: String;
    optNum: Int?;
}

contract ComplexContract {
    storage: Nested;

    init() {
        self.storage = Nested{
            flag: true,
            num: 99,
            text: "hello",
            optNum: null,
        };
    }
}