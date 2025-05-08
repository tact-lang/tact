struct OptionalStruct {
    inner: Int?;
    label: String?;
}

contract OptionalStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ inner: null, label: null };
    }
}