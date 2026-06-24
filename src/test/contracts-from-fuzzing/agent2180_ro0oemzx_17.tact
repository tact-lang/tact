struct DeepNestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct MidLevel {
    d: DeepNestedOpt?;
    e: Int;
}

contract OptDeepOptional {
    val: MidLevel;

    init() {
        self.val = MidLevel{
            d: null,
            e: 5
        };
    }
}