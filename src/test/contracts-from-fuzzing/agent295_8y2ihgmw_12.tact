struct OptAndDefs {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
    x: Int = 5;
    y: Bool = true;
    z: String = "ok";
}

contract OptionalDefaults {
    val: OptAndDefs;

    init() {
        self.val = OptAndDefs{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}