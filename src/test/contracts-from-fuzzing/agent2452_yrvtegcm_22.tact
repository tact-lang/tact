struct Sub { x: Int; }

contract RegularThenOptional {
    another: Int = 5;
    subOpt: Sub? = null;
    init() {
        self.subOpt = null;
        self.another = 10;
    }
}