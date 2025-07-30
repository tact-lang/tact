struct NestedDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

struct Wrap {
    nd: NestedDefaultOpt? = null;
    x: Int = 0;
}

contract TestContract {
    w: Wrap;

    init() {
        self.w = Wrap{};
    }
}