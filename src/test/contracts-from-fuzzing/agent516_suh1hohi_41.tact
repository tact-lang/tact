struct NestedOptBool {
    f: Bool?;
}

contract NullOptBoolCombo {
    nest: NestedOptBool?;
    flag: Bool;

    init() {
        self.nest = null;
        self.flag = true;
    }
}