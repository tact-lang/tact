struct OptionalNested {
    sub1: Int?;
    sub2: Int?;
    sub3: Int?;
}

contract OptionalBig {
    opt: OptionalNested?;
    init() {
        self.opt = null;
    }
}