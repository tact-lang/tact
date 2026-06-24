struct Chain3 {
    foo: Chain2;
}

struct Chain2 {
    bar: Chain1;
}

struct Chain1 {
    val: Int;
}

contract NestedChain {
    data: Chain3;
    init() {
        self.data = Chain3{ foo: Chain2{ bar: Chain1{ val: 42 } } };
    }
}
