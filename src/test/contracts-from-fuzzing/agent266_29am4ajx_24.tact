struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOpts {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a:null,
            b:null,
            c:null,
            d:null
        };
    }
}