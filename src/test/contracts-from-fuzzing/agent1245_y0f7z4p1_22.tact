struct ValStr {
    count: Int;
    label: String;
}

contract MultipleStructVars {
    one: ValStr;
    two: ValStr;

    init() {
        self.one = ValStr{ count: 1, label: "one" };
        self.two = ValStr{ count: 2, label: "two" };
    }
}
