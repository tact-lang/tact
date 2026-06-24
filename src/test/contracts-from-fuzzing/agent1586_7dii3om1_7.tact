struct Person {
    name: String;
    age: Int?;
    nickname: String? = null;
    active: Bool? = true;
}

contract TestContract {
    person: Person;

    init() {
        self.person = Person{
            name: "Bob",
        };
    }

    receive() {}
}