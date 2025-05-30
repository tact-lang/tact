struct NestedOptionals {
    name: String?;
    age: Int?;
    alive: Bool?;
}

contract HasNestedOptionals {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            name: null,
            age: 25,
            alive: true,
        };
    }
}