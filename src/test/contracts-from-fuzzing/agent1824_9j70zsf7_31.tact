// Nested structs with optional nested struct inside required struct
struct Name {
    given: String;
    family: String;
}

struct Person {
    id: Int;
    nickname: String?;
    legalName: Name;
    altName: Name?;
}

contract People {
    p: Person;

    init() {
        self.p = Person{
            id:1,
            nickname:null,
            legalName: Name{ given:"Test", family:"User" },
            altName: null
        };
    }
}
