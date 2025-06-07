struct Child {
    a: Int;
    b: Bool?;
}

struct Parent {
    c: String;
    d: Child?;
    e: Bool?;
}

contract TestContract {
    data: Parent;
    init() {
        self.data = Parent{
            c: "x",
            d: null,
            e: null
        };
    }
}
