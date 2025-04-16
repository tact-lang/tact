struct Sub {
    a: Int;
    b: Bool = true;
}

struct Container {
    sub: Sub?;
    num: Int = 7;
}

contract OptionalNestedStruct {
    data: Container;

    init() {
        self.data = Container{};
    }
}