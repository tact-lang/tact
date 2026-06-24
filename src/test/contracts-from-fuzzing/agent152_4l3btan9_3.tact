struct OptionalStruct {
    id: Int;
    name: String?;
    note: String?;
}

contract TestContract {
    data: OptionalStruct;
    
    init() {
        self.data = OptionalStruct{
            id: 5,
            name: null,
            note: "Some note"
        };
    }
}
