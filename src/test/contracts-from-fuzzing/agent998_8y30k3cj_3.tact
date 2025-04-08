struct Inner {
    flag: Bool;
}

struct Mid {
    count: Int;
    option: Inner?;
}

contract OptionalNestedStructTest {
    meta: Mid;

    init() {
        self.meta = Mid{count: 42, option: Inner{flag: false}};
    }
}