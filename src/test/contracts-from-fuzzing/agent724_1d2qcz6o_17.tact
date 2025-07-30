struct Person {
    name: String = "Alice";
    city: String = "Wonderland";
}

contract TestContract {
    person: Person;

    init() {
        self.person = Person{};
    }
}