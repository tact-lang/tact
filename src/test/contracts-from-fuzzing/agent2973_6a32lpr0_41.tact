struct InnerOpt {
    x: Int?;
}

contract NestedOptInside {
    s: InnerOpt?;

    init() {
        self.s = InnerOpt{ x: null };
    }
}