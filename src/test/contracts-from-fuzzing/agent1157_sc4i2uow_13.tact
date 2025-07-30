struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalsContract {
    opt1: NestedOptionals?;
    opt2: NestedOptionals?;

    init() {
        self.opt1 = NestedOptionals{ a: 1, b: null, c: "hi" };
        self.opt2 = null;
    }
}