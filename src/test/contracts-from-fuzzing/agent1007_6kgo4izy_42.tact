struct InsideOpt {
    a: Int?;
    b: String?;
}

contract NestedOptional2 {
    s: InsideOpt?;

    init() {
        self.s = null;
    }
}