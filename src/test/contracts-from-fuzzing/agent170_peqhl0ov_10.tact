struct NestedDefaults {
    a: Int = 5;
    b: Bool?;
    c: String = "hello";
    d: Int?;
}

contract TestContract {
    mine: NestedDefaults = NestedDefaults{};

    init() {
        self.mine = NestedDefaults{
            a: 42,
            b: true,
            c: "world",
            d: 9,
        };
    }

    receive() {
        let _ = self.mine.d;
    }
}