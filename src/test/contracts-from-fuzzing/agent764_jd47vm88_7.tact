struct ZeroOneOption {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptPrimitives {
    data: ZeroOneOption;

    init() {
        self.data = ZeroOneOption{
            a: null,
            b: false,
            c: null
        };
    }
}