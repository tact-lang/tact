struct BigOptals {
    s1: String?;
    s2: String?;
    s3: String?;
    i1: Int?;
    i2: Int?;
    i3: Int?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract ManyOptionals {
    state: BigOptals;

    init() {
        self.state = BigOptals{
            s1: null,
            s2: "hi",
            s3: null,
            i1: 1,
            i2: null,
            i3: 3,
            b1: true,
            b2: null,
            b3: false,
        };
    }
}
