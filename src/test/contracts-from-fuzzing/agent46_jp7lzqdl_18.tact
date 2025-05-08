struct IntsAndStrings {
    a: Int;
    b: String;
    c: Int?;
    d: String?;
}

contract IntStrMix {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{
            a: 5,
            b: "hello",
            c: null,
            d: null,
        };
    }
}
