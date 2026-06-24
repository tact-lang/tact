struct InnerDef {
    x: Int = 7;
    y: Bool = true;
    z: String = "ok";
}

struct OuterDef {
    a: Int;
    nested: InnerDef;
}

contract PartialInitDefaults {
    value: OuterDef;

    init() {
        self.value = OuterDef{
            a: 5,
            nested: InnerDef{} // explicitly empty, should pick defaults
        };
    }
}