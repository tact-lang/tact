struct Base {
    a: Int as uint3 = 2;
    b: Bool = false;
    c: String? = null;
    d: Int? = null;
}

struct Next {
    inner: Base = Base{};
    opt: Int? = null;
}

struct Higher {
    next: Next = Next{};
}

contract DeepDefaultsMix {
    field: Higher = Higher{};

    init() {
        self.field = self.field;
    }

    receive() {
        self.field = self.field;
    }
}