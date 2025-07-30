struct NestedOptional {
    a: Int?;
    b: String?;
}

struct Container {
    maybe: NestedOptional?;
    fixed: Bool;
}

contract NestedOptField {
    state: Container;

    init() {
        self.state = Container{
            maybe: null,
            fixed: true
        };
    }
}
