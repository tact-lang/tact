struct MixedOptDef {
    a: Int;
    b: String = "B";
    c: Bool?;      // implicit null
    d: Int? = null;
    e: String? = null;
}

contract OmitTail {
    val: MixedOptDef;

    init() {
        self.val = MixedOptDef{
            a: 7
            // omit trailing
        };
    }
}
