// large contract param nesting and a lot of optionality
struct Person {
    name: String;
    age: Int?;
}

struct Employee {
    person: Person?;
    salary: Int?;
    title: String?;
}

contract Org(
    ceo: Employee?,
    cto: Employee?,
    coo: Employee?,
    staffCount: Int
) {}
