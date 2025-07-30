// multiple nested optional structs with partial default and explicit init
struct Inner {
    a: Int? = null;
    b: Bool? = null;
}

struct Mid {
    inner: Inner? = null;
    s: String? = null;
}

contract Test {
    f: Mid? = null;

    init() {
        self.f = null;
    }
}