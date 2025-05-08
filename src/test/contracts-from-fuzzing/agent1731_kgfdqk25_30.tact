struct Sub {
    f: Int;
}

struct Container {
    inner1: Sub;
    inner2: Sub?;
}

contract OptionalAndRequired {
    data: Container;

    init() {
        self.data = Container{
            inner1: Sub{ f: 10 },
            inner2: null
        };
    }
}
