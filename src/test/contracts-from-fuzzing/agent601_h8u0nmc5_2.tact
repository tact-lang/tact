struct Complex {
    flag: Bool;
    amount: Int as uint32;
    note: String;
    maybe: Int?;
}

contract ManyTypes {
    data: Complex;

    init() {
        self.data = Complex{
            flag: true,
            amount: 12345,
            note: "Hello",
            maybe: null,
        };
    }
}
