struct OptionalStruct {
    name: String;
    age: Int?;
}

contract OptionalFieldContract {
    person: OptionalStruct;

    init() {
        self.person = OptionalStruct{
            name: "Alex",
            age: null,
        };
    }
}