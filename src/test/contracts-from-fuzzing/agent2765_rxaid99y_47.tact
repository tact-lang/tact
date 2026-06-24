struct Inn {
    n: Int?;
}

struct Mid {
    inner: Inn;
}

contract NestedNullStart {
    m: Mid;
    init() {
        self.m = Mid{inner: Inn{n: null}};
    }
}