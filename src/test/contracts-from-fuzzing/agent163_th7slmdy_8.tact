struct Child {
    name: String;
    age: Int;
}

struct Parent {
    first: Child;
    second: Child;
    note: String;
}

contract FamilyTree {
    fam: Parent;

    init() {
        self.fam = Parent{
            first: Child{ name: "Alice", age: 10 },
            second: Child{ name: "Bob", age: 12 },
            note: "Test"
        };
    }
}