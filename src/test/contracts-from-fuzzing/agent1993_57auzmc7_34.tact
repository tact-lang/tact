struct DefNestedOptional {
    x: Int? = null;
    y: String? = null;
}

contract Holder {
    dno: DefNestedOptional;

    init() {
        self.dno = DefNestedOptional{};
    }
}