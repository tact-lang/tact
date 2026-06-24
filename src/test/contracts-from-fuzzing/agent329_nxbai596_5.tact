struct OptionalNested {
    nested: Int?;
    flag: Bool;
}

struct Container {
    data: OptionalNested?;
}

contract TestContract {
    cont: Container;
    init() {
        self.cont = Container{
            data: OptionalNested{
                nested: null,
                flag: false,
            },
        };
    }
}