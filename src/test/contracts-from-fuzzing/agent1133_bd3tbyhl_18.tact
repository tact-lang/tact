struct UnusualOrder {
    str: String;
    number: Int;
    optBool: Bool?;
    s2: String?;
    num2: Int;
    flag: Bool;
}

contract MixedFieldOrder {
    data: UnusualOrder;

    init() {
        self.data = UnusualOrder{
            str: "abc",
            number: 1,
            optBool: false,
            s2: null,
            num2: 10,
            flag: true
        };
    }
}