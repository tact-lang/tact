struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptStructField {
    multi: MultiOptional;

    init() {
        self.multi = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}