// Testing fields using optional structs
struct Person {
    name: String;
    age: Int?;
}

contract TestContract {
    maybePerson: Person?;

    init() {
        self.maybePerson = null;
    }
}
