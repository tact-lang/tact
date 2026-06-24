struct Person {
    name: String;
    age: Int;
    nickname: String?;
}

contract TestContract {
    p: Person = Person{
        name: "John",
        age: 30,
        nickname: null
    };

    init() {
        self.p = Person{
            name: "Jane",
            age: 25,
            nickname: "JJ"
        };
    }
    receive() {}
}