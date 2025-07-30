struct Person {
    name: String = "anon";
    nickname: String?;
    id: Int;
}

contract Test {
    p: Person;

    init() {
        self.p = Person{
            id: 42,
            nickname: null
        };
    }
}
