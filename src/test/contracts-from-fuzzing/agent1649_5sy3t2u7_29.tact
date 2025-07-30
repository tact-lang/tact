struct Odd {
    opt1: Int?;
    opt2: Int?;
    flag: Bool;
    inner: Int;
    text: String;
}

contract OptionalMix {
    data: Odd;

    init() {
        self.data = Odd{
            opt1: null,
            opt2: null,
            flag: true,
            inner: 5,
            text: "hello"
        };
    }
}