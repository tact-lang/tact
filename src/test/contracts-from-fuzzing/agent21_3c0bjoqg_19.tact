struct PartiallyDefaulted {
    a: Int;
    b: Int = 2;
    c: Int;
    d: Int = 4;
}

contract TestContract {
    pdef: PartiallyDefaulted;

    init() {
        self.pdef = PartiallyDefaulted{
            a: 1,
            c: 3
        };
    }
}