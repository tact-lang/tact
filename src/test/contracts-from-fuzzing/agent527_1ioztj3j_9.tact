struct OptStrBool {
    str: String?;
    b: Bool?;
    intVal: Int;
}

contract OptionalMix {
    stored: OptStrBool;
    init() {
        self.stored = OptStrBool{
            str: null,
            b: null,
            intVal: 123,
        };
    }
}