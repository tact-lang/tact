struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
}

contract Test {
    dv: DefaultVals;

    init() {
        self.dv = DefaultVals{
            a: 1,
            b: false,
            c: "set"
        };
    }
}
