struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Container {
    np: NestedOptional?;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            np: NestedOptional{
                x: null,
                y: null,
            }
        };
    }
}