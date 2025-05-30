struct DeepNull {
    nested: NestedOpt?;
}

struct NestedOpt {
    num: Int?;
}

contract BugTry {
    data: DeepNull = DeepNull{};
    init() {
        self.data = DeepNull{ nested: NestedOpt{} };
    }
}