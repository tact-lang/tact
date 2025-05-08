struct OptionalWrapper {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    addressVal: Address?;
}

contract OptionalStorage {
    stored: OptionalWrapper;

    init() {
        self.stored = OptionalWrapper{
            intVal: null,
            boolVal: null,
            stringVal: null,
            addressVal: null,
        };
    }
}