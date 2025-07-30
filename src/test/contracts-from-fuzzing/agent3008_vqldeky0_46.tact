struct Child {
    flag: Bool = true;
    val: Int = 1;
}

contract ManyDefaults {
    child1: Child = Child{};
    child2: Child = Child{};

    init() {
        self.child1 = Child{};
        self.child2 = Child{};
    }
}