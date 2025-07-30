struct OptionalStrings {
    s1: String?; s2: String?; s3: String?; s4: String?;
}

struct InnerLayer {
    val: Int; nested: OptionalStrings;
}

contract OptionalStructs {
    x: OptionalStrings;
    y: InnerLayer;

    init() {
        self.x = OptionalStrings{ s1: null, s2: null, s3: null, s4: null };
        self.y = InnerLayer{ val: 5, nested: OptionalStrings{ s1: null, s2: null, s3: null, s4: null }};
    }
}