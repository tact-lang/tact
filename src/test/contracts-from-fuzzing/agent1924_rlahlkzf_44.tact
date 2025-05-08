struct OptionalSliceCellDefaults {
    s: Slice? = null;
    c: Cell? = null;
}

contract TestContract {
    stuff: OptionalSliceCellDefaults;

    init() {
        self.stuff = OptionalSliceCellDefaults{};
    }
}