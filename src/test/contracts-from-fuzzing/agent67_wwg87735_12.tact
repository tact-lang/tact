struct OptionalNestedString {
    text: String?;
    intVal: Int;
}

contract OptStringInPersist {
    data: OptionalNestedString;

    init() {
        self.data = OptionalNestedString{
            text: null,
            intVal: 0
        };
    }
}
