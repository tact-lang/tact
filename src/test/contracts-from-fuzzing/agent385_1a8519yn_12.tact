struct ManyStringsBools {
    s1: String;
    b1: Bool;
    s2: String;
    b2: Bool;
    s3: String;
}

contract StringsBoolsMix {
    data: ManyStringsBools;

    init() {
        self.data = ManyStringsBools{
            s1: "one",
            b1: true,
            s2: "two",
            b2: false,
            s3: "three"
        };
    }
}
