struct BoolNest {
    a: Bool = true;
    b: Bool?;
}

struct Container {
    inner: BoolNest;
    flag: Bool?;
}

contract BoolOptionals {
    state: Container;

    init() {
        self.state = Container{ inner: BoolNest{ a: false, b: null }, flag: true };
    }
}