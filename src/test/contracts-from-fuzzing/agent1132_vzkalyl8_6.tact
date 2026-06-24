struct OptionalStruct {
    id: Int;
    label: String;
}

contract OptField {
    item: OptionalStruct? = null;
    
    init() {
        self.item = OptionalStruct{id: 7, label: "test"};
    }
}