struct Child {
    x: Int?;
    y: String?;
}

contract OptNested {
    child: Child?;

    init() {
        self.child = Child{
            x: 42,
            y: "yo",
        };
    }
}
