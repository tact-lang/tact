struct NestedDeeper {
    a: Int;
    b: Bool;
}

struct LayerTwo {
    nested: NestedDeeper;
    flag: Bool;
}

struct LayerOne {
    l2: LayerTwo;
    addr: Address;
}

contract MultiLayer {
    data: LayerOne;

    init() {
        self.data = LayerOne {
            l2: LayerTwo {
                nested: NestedDeeper { a: 3, b: false },
                flag: true
            },
            addr: myAddress()
        };
    }
}