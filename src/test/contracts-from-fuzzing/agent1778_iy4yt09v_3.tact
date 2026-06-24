struct Child {
    name: String;
    optInt: Int?;
}

contract OptNested {
    item: Child?;

    init() {
        self.item = Child{name: "abc", optInt: 5};
    }
}