struct InnerS {
    b: Bool;
    s: String;
}

struct OuterS {
    some: Int;
    nested: InnerS;
}

contract OptionalDeepNested {
    outerOpt: OuterS?;

    init() {
        self.outerOpt = null;
    }
}