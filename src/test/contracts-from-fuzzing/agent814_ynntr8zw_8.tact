struct BoolNest {
    val: Bool;
    nested: Bool?;
}

contract TestBools {
    f1: BoolNest;

    init() {
        self.f1 = BoolNest{
            val: true,
            nested: null,
        };
    }
}