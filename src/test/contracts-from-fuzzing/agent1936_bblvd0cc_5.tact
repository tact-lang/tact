struct OptNested {
    name: String = "Default";
    age: Int?; 
}

contract OptionalStructField {
    data: OptNested;

    init() {
        self.data = OptNested{
            age: null,
            name: "Name"
        };
    }
}