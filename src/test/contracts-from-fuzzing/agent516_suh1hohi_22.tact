struct InnerLevel {
    innerVal: Int?;
}

struct OuterLevel {
    outerVal: InnerLevel?;
}

contract OptionalInOptional {
    combo: OuterLevel?;

    init() {
        self.combo = null;
    }
}
