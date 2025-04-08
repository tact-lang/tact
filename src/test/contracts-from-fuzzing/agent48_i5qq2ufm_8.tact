struct NestedOptional {
    fld: Int?;
}

contract NestedOptionalStorage {
    nos: NestedOptional?;

    init() {
        self.nos = null;
    }

    receive() {}
}