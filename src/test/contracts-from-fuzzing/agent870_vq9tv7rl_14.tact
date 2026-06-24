struct DefaultVals {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";
}

contract DefVals {
    d: DefaultVals = DefaultVals{};

    init() {
        self.d = DefaultVals{
            a: 10,
            b: true,
            c: "changed"
        };
    }
}
