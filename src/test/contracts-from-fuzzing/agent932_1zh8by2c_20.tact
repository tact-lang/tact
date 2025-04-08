// Optional outer + nested non-optional struct + inner optional fields
struct Innermost {
    x: Int?;
    y: Bool?;
}

struct MiddleNonOptional {
    inner: Innermost;
    flag: Bool;
}

contract OuterOptional {
    nested: MiddleNonOptional?;

    init() {
        self.nested = null;
    }
}
