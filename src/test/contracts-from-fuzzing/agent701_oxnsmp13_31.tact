struct Child {
    data: Int = 42;
}

contract OptAssign {
    child: Child?;

    init() {
        self.child = Child{};
    }
}