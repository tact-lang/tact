struct Inner {
    foo: Int?;
}

struct Mid {
    child: Inner;
}

struct Outer {
    middle: Mid;
}

contract DeepNestedNullable {
    store: Outer;
    init() {
        self.store = Outer{ middle: Mid{ child: Inner{ foo: null } } };
    }
}