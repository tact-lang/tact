struct NestedOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract MultiOpt {
    a: NestedOptionals? = null;
    b: NestedOptionals? = null;

    init() {
        self.a = NestedOptionals{ x: 7, y: true, s: "foo" };
        self.b = null;
    }
}