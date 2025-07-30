struct NestedOptional {
    val: Int?;
}

struct Wrap {
    nested: NestedOptional?;
    message: String = "";
}

contract OptionalWrapped {
    data: Wrap;

    init() {
        self.data = Wrap{
            nested: null,
            message: "Hello",
        };
    }
}