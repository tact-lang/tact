struct OptionalEmbedded {
    s: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract ComplexOptionalTest {
    p: OptionalEmbedded;

    init() {
        self.p = OptionalEmbedded{ s: InnerStruct{ val: 9, flag: true } };
    }
}