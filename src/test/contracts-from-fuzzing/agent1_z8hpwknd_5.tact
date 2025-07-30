struct InnerOpt {
    val: Int?;
}

contract NestedOptional {
    nestedOpt: InnerOpt;

    init() {
        self.nestedOpt = InnerOpt{ val: null };
    }
}