struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: Int?;
}

contract TestDefaults {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{
            c: null
        };
    }
}