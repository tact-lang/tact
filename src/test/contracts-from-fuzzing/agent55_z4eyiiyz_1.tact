struct Person {
    age: Int;
    flag: Bool;
    text: String;
    id: Int;
}

contract StorageTest {
    user: Person;

    init() {
        self.user = Person{
            age: 21,
            flag: true,
            text: "Hello",
            id: 1
        };
    }
}
