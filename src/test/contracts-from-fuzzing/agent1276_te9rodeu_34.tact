struct Inner {
    x: Int?;           // optional, unset
    y: Int = 42;       // defaulted
    z: Bool?;          // optional, unset
}

contract PartialInitOptional {
    f: Inner;

    init() {
        self.f = Inner{
            y: 99,
        };
    }
}