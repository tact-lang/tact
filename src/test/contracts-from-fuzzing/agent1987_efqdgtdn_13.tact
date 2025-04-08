struct MultiOption {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract MultiOptional {
    data: MultiOption;
    init() {
        self.data = MultiOption{
            a:null, b:"x", c:true, d:null
        };
    }
}