struct Container {
    nested1: InnerOne;
    nested2: InnerTwo;
}

struct InnerOne {
    flag: Bool;
    count: Int;
}

struct InnerTwo {
    text: String;
    addr: Address;
}

contract TestMultiNested {
    data: Container;

    init() {
        self.data = Container{
            nested1: InnerOne{ flag: true, count: 10 },
            nested2: InnerTwo{ text: "x", addr: myAddress() }
        };
    }
}
