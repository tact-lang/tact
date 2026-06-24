struct MiddleOpt {
    s1: Int?;
    s2: Bool?;
}

struct OuterOpt {
    inner: MiddleOpt?;
    val: Int;
}

contract NestedOptional {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            val: 42
        };
    }
}