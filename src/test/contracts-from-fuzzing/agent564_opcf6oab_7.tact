struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OmitInitOptionals {
    s: Inner;

    init() {
        self.s = Inner{
            x: 5
        };
    }
}
