struct Person {
    age: Int = 18;
    active: Bool = true;
    nickname: String = "anon";
}

contract TestContract {
    person: Person = Person{};

    init() {
        self.person = Person { age: 42, active: false, nickname: "fuzz" };
    }
}