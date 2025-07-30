struct DeepOptional {
    val: Int?;
}

struct Container {
    number: Int;
    nestedOpt: DeepOptional;
}

contract OptInNested {
    data: Container;

    init() {
        self.data = Container{number: 5, nestedOpt: DeepOptional{val: null}};
    }
}