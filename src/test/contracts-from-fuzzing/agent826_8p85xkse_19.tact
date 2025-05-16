message Person {
    id: Int;
    name: String;
}

contract TestContract {
    p: Person = Person{ id: 1, name: "A" };

    init() {
        self.p = Person{ id: 2, name: "B" };
    }
}
