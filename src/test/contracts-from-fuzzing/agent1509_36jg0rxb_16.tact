struct IntString {
    a: Int;
    b: String;
}

contract ContractFieldOrder {
    x: IntString;

    init() {
        self.x = IntString{
            a: 77,
            b: "order",
        };
    }
}