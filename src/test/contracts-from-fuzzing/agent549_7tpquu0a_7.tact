struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MultiOpt {
    m: MultiOptional;
    init() {
        self.m = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}