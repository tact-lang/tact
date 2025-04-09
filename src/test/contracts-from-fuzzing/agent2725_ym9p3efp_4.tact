struct InnerOpt {
    key: Int; val: Int?; text: String?;
}

struct Wrapper {
    nested: InnerOpt?;
    flag: Bool;
}

contract OptNestedFields {
    data: Wrapper;

    init() {
        self.data = Wrapper{ nested: null, flag: true };
    }
}