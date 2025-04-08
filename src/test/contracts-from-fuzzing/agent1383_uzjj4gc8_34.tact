struct NestedDefault {
    x: Int = 7;
    y: String = "abc";
}

contract NestedInlineDefaults {
    n: NestedDefault = NestedDefault{};
    init() {
        self.n = NestedDefault{ x:42, y:"z" };
    }
}