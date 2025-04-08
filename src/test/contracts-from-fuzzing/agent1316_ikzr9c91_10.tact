// deeply nested optionals inside optional (should be disallowed if nested optional)
struct InnerMost {
    val: Int;
}

struct MiddleOpt {
    deep: InnerMost?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract NestedOptOptContract {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{ middle: null };
    }
}