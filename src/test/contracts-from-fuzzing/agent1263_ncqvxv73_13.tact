// combining complex struct and many primitive persistent fields
struct Person {
    name: String;
    nickname: String?;
    email: String;
    age: Int;
    active: Bool;
}

contract Test {
    id: Int;
    p1: Person;
    note: String;
    flag: Bool;
    opt: String?;

    init() {
        self.id = 101;
        self.p1 = Person{
            name: "name",
            nickname: null,
            email: "email",
            age: 33,
            active: true
        };
        self.note = "note";
        self.flag = false;
        self.opt = null;
    }
}