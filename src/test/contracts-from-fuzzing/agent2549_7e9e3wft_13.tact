struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract MultiOptFields {
    data: MultiOpt;
    
    init() {
        self.data = MultiOpt{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}