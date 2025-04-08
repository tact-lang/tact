struct PartDef {
    a: Int = 1;
    b: Bool? = null;
    c: String = "foo";
    d: Int = 10;
}

contract PartOverride {
    data: PartDef;

    init() {
        self.data = PartDef{
            b: true,
            d: 42,
        };
    }
}