struct Container {
    num: Int;
    optionalData: Bool?;
    description: String;
}

contract NestedOptionalAndNonOptional {
    s: Container;

    init() {
        self.s = Container{
            num: 42,
            optionalData: null,
            description: "desc"
        };
    }
}