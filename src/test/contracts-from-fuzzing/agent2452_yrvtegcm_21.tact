struct Sub { x: Int; }

contract OptionalFirstThenRegular {
    subOpt: Sub? = null;
    another: Int = 5;
    init() {
        self.subOpt = null;
        self.another = 10;
    }
}