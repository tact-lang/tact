struct ContainingBoolIntString {
    bb: Bool;
    ii: Int;
    ss: String;
}

contract DiffOrderAssign {
    nested: ContainingBoolIntString;

    init() {
        self.nested = ContainingBoolIntString{ ss:"s", bb: true, ii: 100 };
    }
}