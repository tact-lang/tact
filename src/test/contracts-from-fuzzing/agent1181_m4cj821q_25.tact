struct NestedOption {
    aa: String?;
    bb: OptionInner?;
}

struct OptionInner {
    i: Int;
    s: String?;
}

contract TestContract {
    field: NestedOption;

    init() {
        self.field = NestedOption{
            aa: null,
            bb: null
        };
    }
}