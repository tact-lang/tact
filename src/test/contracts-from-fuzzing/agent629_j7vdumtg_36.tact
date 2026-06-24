struct OptionalStringPrim {
    x: String?;
}

contract AssignNulls {
    os: OptionalStringPrim;

    init() {
        self.os = OptionalStringPrim{ x: null };
    }
}