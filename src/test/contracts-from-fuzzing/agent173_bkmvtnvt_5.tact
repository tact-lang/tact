struct Full {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalsEverywhere {
    data: Full?;

    init() {
        self.data = Full{
            a: 123,
            b: true,
            c: "test"
        };
    }
}