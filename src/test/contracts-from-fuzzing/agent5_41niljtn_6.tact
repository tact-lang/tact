struct Complex {
    num: Int;
    flag: Bool;
    text: String;
    optText: String?;
}

contract OptionalInner {
    data: Complex?;

    init() {
        self.data = Complex{
            num: 5,
            flag: true,
            text: "hi",
            optText: null
        };
    }
}