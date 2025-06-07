struct NestedOptional {
    str: String?;
    flag: Bool?;
}

struct Container {
    nestedOpt: NestedOptional?;
    num: Int;
}

contract OptAround {
    data: Container;

    init() {
        self.data = Container{
            nestedOpt: null,
            num: 321
        };
    }

    receive() {}
}