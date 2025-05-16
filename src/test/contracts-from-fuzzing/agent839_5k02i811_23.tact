struct InnerOpt {
    str: String?;
}

contract InitNestedSet {
    f: InnerOpt;
    init() {
        self.f = InnerOpt{str: null};
    }
}