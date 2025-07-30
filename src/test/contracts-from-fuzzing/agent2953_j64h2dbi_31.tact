struct OptionalNullable {
    text: String?;
}

contract OptNullStruct {
    f: OptionalNullable?;

    init() {
        self.f = null;
    }
}