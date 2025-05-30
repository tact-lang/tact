struct OptionalStruct {
    name: String;
    age: Int?;
}

contract OptStorage {
    user: OptionalStruct;
    
    init() {
        self.user = OptionalStruct{
            name: "Alice",
            age: null
        };
    }
}
