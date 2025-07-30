struct Person {
    name: String = "Alice";
    age: Int = 42;
    lucky: Int;
}

contract StructDefaultPartial {
    val: Person;
    init() {
        self.val = Person{ lucky: 7 };
    }
}