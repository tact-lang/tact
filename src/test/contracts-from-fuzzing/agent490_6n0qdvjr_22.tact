struct Weird {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract MixedOpts {
    s: Weird;
    init() {
        self.s = Weird{
            a: null,
            b: null,
            c: null
        };
    }
}