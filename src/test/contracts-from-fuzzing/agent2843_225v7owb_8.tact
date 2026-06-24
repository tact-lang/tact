struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract Test8 {
    m: MultiOptional;

    init() {
        self.m = MultiOptional{
            a: 123,
            b: "abc",
            c: false,
            d: myAddress()
        };
    }
}