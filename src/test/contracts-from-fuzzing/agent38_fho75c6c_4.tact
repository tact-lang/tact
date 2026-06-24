struct OptStruct {
    note: String?;
    version: Int?;
}

contract OptionalFields {
    metadata: OptStruct;

    init() {
        self.metadata = OptStruct {
            note: null,
            version: null
        };
    }
}