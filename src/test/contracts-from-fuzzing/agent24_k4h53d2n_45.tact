struct WrappedOptPrims {
    x: Int?;
    b: Bool?;
    s: String?;
}

contract WrappedOptionals {
    w: WrappedOptPrims;

    init() {
        self.w = WrappedOptPrims{
            x:null,
            b:null,
            s:null,
        };
    }
}