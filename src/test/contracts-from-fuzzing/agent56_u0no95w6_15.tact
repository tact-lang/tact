struct InnerMost {
    val: Int;
}

struct Mid {
    inner: InnerMost;
}

struct OuterMost {
    mid: Mid;
}

contract NestedStructsOptional {
    data: OuterMost?;

    init() {
        self.data = null;
    }
}