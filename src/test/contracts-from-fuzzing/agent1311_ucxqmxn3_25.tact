struct OptionalStringStruct {
    field: String?;
}

contract TestContract {
    s: OptionalStringStruct;

    init() {
        self.s = OptionalStringStruct{ field: null };
    }
}
