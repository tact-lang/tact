struct NestedDefault {
    a: Int = 123;
    b: Bool = false;
    c: String = "abc";
}

contract TestContract {
    var: NestedDefault;

    init() {
        self.var = NestedDefault{};
    }
}