struct InnerDef {
    a: Int as uint8 = 5;
    b: Int as int16 = -7;
}

struct OuterDef {
    inner: InnerDef;
    name: String = "test";
}

contract DefaultsPlusSerialization {
    data: OuterDef;

    init() {
        self.data = OuterDef{inner: InnerDef{}, name: "override"};
    }
}