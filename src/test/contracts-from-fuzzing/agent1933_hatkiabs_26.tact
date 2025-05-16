struct NestedStr {
    info: String;
}

contract AssignToOptional {
    s: NestedStr?;

    init() {
        self.s = NestedStr{ info: "hello" };
    }
}