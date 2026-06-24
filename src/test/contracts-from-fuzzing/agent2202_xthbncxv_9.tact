// testing default values for nested optional fields
struct Human {
    name: String = "";
    age: Int?; // defaults to null
}

contract DefaultNestedOptional {
    human: Human;

    init() {
        self.human = Human{};
    }
}