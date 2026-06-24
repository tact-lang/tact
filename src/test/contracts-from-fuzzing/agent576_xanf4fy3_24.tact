struct PartDef {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract PartialOverride {
    stuff: PartDef;

    init() {
        self.stuff = PartDef{
            a: 10,
            c: 30
        };
    }
}
