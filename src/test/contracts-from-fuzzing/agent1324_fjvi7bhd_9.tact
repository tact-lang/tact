struct Person {
    age: Int;
    nickname: String?;
}

contract NestedOptionalAssign {
    user: Person;

    init() {
        self.user = Person{
            age: 25,
            nickname: null,
        };
    }
}