struct HasDefault {
    foo: Int = 12;
    bar: Bool = true;
}

struct Container {
    stuff: HasDefault;
}

contract DefValsNested {
    v: Container;

    init() {
        self.v = Container{
            stuff: HasDefault{}
        };
    }
}