struct OptionalNest {
    id: Int;
    tag: String?;
    note: String?;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            id: 99,
            tag: null,
            note: "hi"
        };
    }
}