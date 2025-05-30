struct SInner {
    a: Int;
    b: Bool;
}

contract OptionalStructVar {
    myopt: SInner?;
    init() {
        self.myopt = null;
    }
}