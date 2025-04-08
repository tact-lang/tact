struct BigOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptionalsContract {
    s: BigOptional;
    init() {
        self.s = BigOptional {
            a: null,
            b: null,
            c: 3,
            d: null,
            e: 5
        };
    }
}