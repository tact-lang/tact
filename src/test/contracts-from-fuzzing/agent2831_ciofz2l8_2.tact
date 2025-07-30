struct InnerNestedOpt {
    nestedOpt: Int?;
}

contract NestedStructOpt {
    nested: InnerNestedOpt;

    init() {
        self.nested = InnerNestedOpt{ nestedOpt: null };
    }
}
