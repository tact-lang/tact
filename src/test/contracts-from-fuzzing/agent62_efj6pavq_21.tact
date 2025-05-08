struct NestedDefaultsOptionals {
    a: Int? = null;
    b: String = "abc";
    c: Bool?;
}

contract NestedOpts {
    data: NestedDefaultsOptionals;

    init() {
        self.data = NestedDefaultsOptionals{};
    }
}
