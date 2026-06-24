struct OneOptDeep {
    sub: TwoOptDeep?;
}
struct TwoOptDeep {
    val1: Int?;
    val2: Int?;
}

contract OptDepth {
    f: OneOptDeep;
    init() {
        self.f = OneOptDeep{
            sub: TwoOptDeep{
                val1: null,
                val2: null
            }
        };
    }
}