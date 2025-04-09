struct BoolNest {
    ai: Int?;
    ab: Bool?;
}

contract OptBoolInt {
    b: BoolNest;

    init() {
        self.b = BoolNest{
            ai: null,
            ab: null
        };
    }
}