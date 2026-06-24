struct Person {
    name: String = "Anonymous";
    email: String?;
}

contract PersonStorage {
    owner: Person = Person{};

    init() {}
}