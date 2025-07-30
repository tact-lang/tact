struct House {
    rooms: Int?;
    addressText: String;
}

struct Person {
    age: Int;
    nickname: String?;
    house: House?;
}

struct Root {
    owner: Person?;
    count: Int;
}

contract SkipDeepNestedOptionals {
    state: Root;

    init() {
        self.state = Root{
            owner: Person{
                age: 50,
                nickname: null,
                house: null
            },
            count: 17
        };
    }

    receive() {}
}