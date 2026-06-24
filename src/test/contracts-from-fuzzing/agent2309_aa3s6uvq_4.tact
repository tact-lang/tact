struct OptNest {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
}

contract OptNested {
    val: OptNest;

    init() {
        self.val = OptNest{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}