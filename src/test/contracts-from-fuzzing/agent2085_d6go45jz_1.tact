struct SingleIntField { field: Int; }

contract TestContract {
    s: SingleIntField;

    init() {
        self.s = SingleIntField{ field: 42 };
    }
}