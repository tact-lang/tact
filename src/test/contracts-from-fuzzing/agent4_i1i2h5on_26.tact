struct Mixed {
    req: Int;
    opt1: Int?;
    opt2: Bool?;
}

contract TestContract {
    d: Mixed;

    init() {
        self.d = Mixed {
            req: 5
            // omit optionals
        };
    }
}
