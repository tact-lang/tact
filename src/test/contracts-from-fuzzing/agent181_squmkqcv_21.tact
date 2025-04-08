struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool? = false;
}

contract TestDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            c: null
        };
    }
}
