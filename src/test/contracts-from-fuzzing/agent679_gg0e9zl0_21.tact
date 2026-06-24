// Deep nesting with optional struct and nested defaulted struct
struct Inner {
    flag: Bool = false;
}

struct Middle {
    nested: Inner = Inner{};
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            middle: null,
        };
    }
}