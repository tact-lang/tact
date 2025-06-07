struct Sub {
    foo: Int = 77;
    bar: Bool = true;
}

struct Container {
    sub: Sub;
    val: Int = 12;
}

contract NestedDefaultsPropagation {
    st: Container;

    init() {
        self.st = Container{
            sub: Sub{},
        };
    }
}
