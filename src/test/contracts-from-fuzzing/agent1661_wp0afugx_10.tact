struct OptionalDeepNested {
    s: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract OptionalDeepTest {
    nestedOpt: OptionalDeepNested;

    init() {
        self.nestedOpt = OptionalDeepNested{
            s: null
        };
    }
}