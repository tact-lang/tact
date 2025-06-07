struct Person {
    age: Int;
    nickname: String?;
    contact: Address?;
}

contract Test {
    p: Person;

    init() {
        self.p = Person{
            age: 25
            // no nickname or contact; default null
        };
    }
}