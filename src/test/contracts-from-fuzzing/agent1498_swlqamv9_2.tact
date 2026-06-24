struct Sub {
    x: Int;
    y: Bool;
}

struct Container {
    sub: Sub?;
    flag: Bool;
}

contract OptionalNested {
    data: Container;

    init() {
        self.data = Container{
            sub: null,
            flag: true,
        };
    }
}