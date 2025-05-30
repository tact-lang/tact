struct OptionalStruct {
    count: Int;
    label: String;
}

contract OptField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}