struct NestedOptions {
    nested: InnerOption?;
    num: Int;
}

struct InnerOption {
    innerVal: Int?;
    flag: Bool;
}

contract OptContract {
    d: NestedOptions;

    init() {
        self.d = NestedOptions {
            nested: InnerOption { innerVal: null, flag: true },
            num: 77
        };
    }
}