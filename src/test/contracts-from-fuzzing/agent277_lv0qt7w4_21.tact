struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
}
contract Test {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{
            d: null
        };
    }
}