struct DeepNestedOptionals {
    n1: Int?;
    n2: Bool?;
    n3: String?;
}

contract TestContract {
    opt: DeepNestedOptionals?;

    init() {
        self.opt = DeepNestedOptionals{
            n1: 1,
            n2: true,
            n3: "test",
        };
    }
}
