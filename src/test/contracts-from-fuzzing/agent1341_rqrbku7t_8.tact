struct WithDefaults {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
    d: Address;
}

contract DefaultStructField {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            d: myAddress(),
        };
    }
}