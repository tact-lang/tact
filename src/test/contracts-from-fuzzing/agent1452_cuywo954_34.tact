struct Compose {
    number: Int;
    flag: Bool;
    text: String;
    optNumber: Int?;
    optFlag: Bool?;
    optText: String?;
}

contract ComposeStorage {
    s: Compose;

    init() {
        self.s = Compose{
            number: 5,
            flag: true,
            text: "hello",
            optNumber: null,
            optFlag: false,
            optText: null
        };
    }
}
