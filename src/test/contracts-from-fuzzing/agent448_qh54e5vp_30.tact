struct Inner {
    x: Int;
}

struct Container {
    data: Inner;
}

contract ContractFieldStruct {
    f: Container;
    init() {
        self.f = Container{ data: Inner{ x:42 } };
    }
}