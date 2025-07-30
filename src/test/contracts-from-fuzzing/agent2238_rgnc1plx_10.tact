struct WithDefaults {
    a: Int = 12;
    b: Bool;
    c: String = "default";
    d: Int?;
}

contract TestContract {
    mydata: WithDefaults;

    init() {
        self.mydata = WithDefaults{
            b: true,
            d: null,
        };
    }
}
