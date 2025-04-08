struct Person {
    name: String;
    age: Int?;
}

contract Test {
    person: Person? = null;
    init() {
        self.person = null;
    }
}