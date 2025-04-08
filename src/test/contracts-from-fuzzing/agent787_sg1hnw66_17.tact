struct Person {
    name: String;
    age: Int;
}

contract TestContract {
    user: Person? = null;

    init() {
        self.user = Person{ name: "Alice", age: 30 };
    }
}