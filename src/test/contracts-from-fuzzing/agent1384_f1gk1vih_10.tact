struct DeeplyNestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct MiddleLayer {
    d: DeeplyNestedOptional?;
}

struct OuterLayer {
    e: MiddleLayer?;
}

contract ComplexOptional {
    optStruct: OuterLayer?;

    init() {
        self.optStruct = null;
    }
}