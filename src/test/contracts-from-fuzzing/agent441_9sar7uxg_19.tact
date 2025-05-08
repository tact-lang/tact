struct InnerOne {
    f1: Int;
    f2: Bool;
}

struct InnerTwo {
    f1: String;
    f2: Address;
}

struct Layered {
    a: InnerOne;
    b: Int;
    c: InnerTwo;
    d: Bool;
}

contract TestContract {
    test: Layered;

    init() {
        self.test = Layered{
            a: InnerOne{ f1: 1, f2: true },
            b: 2,
            c: InnerTwo{ f1: "x", f2: myAddress() },
            d: false,
        };
    }
}