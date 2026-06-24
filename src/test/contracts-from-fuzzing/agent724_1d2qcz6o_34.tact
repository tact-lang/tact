struct Person {
    name: String = "Unnamed";
    nick: String? = null;
    bio: String?;
}

contract TestContract {
    p: Person;

    init() {
        self.p = Person{
            bio: null
        };
    }
}