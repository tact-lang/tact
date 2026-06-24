struct OptionalStruct {
    name: String = "Alice";
    age: Int?;
    flag: Bool?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            age: null,
            flag: true
        };
    }
}