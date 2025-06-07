struct DeepTest {
    optLevel: Mid?;
}

struct Mid {
    inner: EndStruct;
}

struct EndStruct {
    value: Int? = null;
}

contract ExplicitNullVsDefault {
    s: DeepTest;

    init() {
        self.s = DeepTest { optLevel: null };
    }
}
