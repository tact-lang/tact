struct OptNested {
    s1: Int?;
    s2: Bool?;
    s3: String?;
}

contract MixedOptional {
    a: Int;
    b: OptNested;
    c: Bool?;

    init() {
        self.a = 1;
        self.b = OptNested{
            s1: null,
            s2: true,
            s3: "ok",
        };
        self.c = null;
    }
}