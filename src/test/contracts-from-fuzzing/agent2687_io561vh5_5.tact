struct OptionalStruct {
    name: String = "default";
    age: Int?;
}

contract OptionalStructStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ age: null };
    }
}