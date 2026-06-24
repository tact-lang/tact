struct OptionalNested {
    val: Int?;
}

contract TestContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{ val: null };
    }
}