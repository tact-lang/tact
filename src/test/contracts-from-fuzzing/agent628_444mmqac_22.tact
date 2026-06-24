struct NestedOptStr {
    opt: String?;
}

contract OptionalStructInside {
    wrapper: NestedOptStr;

    init() {
        self.wrapper = NestedOptStr{ opt: null };
    }
}