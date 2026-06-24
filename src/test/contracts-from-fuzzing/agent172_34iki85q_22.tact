struct Nickname {
    nick: String;
}

struct Person {
    id: Int as uint32;
    alias: Nickname?;
}

contract OptionalStructRefs {
    person: Person;

    init() {
        self.person = Person{
            id: 101,
            alias: null,
        };
    }
}