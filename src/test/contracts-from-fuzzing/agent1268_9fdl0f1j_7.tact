struct DeeplyNested {
    d1: Int;
    d2: Int?;
    d3: String?;
}

struct MiddleLevel {
    m: DeeplyNested;
}

struct TopLevel {
    t: MiddleLevel;
}

contract DeepNestedOptionals {
    top: TopLevel?;

    init() {
        self.top = null;
    }
}