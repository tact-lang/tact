struct DoubleLayer {
    a: Int;
    b: Bool;
}

contract AssignStructThenOverwriteField {
    s: DoubleLayer;

    init() {
        self.s = DoubleLayer{a:1,b:false};
        self.s.a = 99;
    }
}