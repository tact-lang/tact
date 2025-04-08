struct Person {
    name: String;
    age: Int as uint8;
    email: String?;
}

struct Company {
    title: String;
    ceo: Person;
    description: String?;
}

contract ParamMixed(
    id: Int,
    flag: Bool?,
    person: Person,
    company: Company
) {
    receive() {}
}