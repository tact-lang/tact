struct InnerOptional {
    optInt: Int?;
}

struct OuterOptional {
    maybeInner: InnerOptional?;
}

contract NestedOptionalTest {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{ maybeInner: null };
    }
}