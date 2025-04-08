struct InnerOne {
    foo: Int;
}

struct InnerTwo {
    bar: Bool;
}

struct Combo {
    first: InnerOne;
    second: InnerTwo;
}

contract MultiStructField {
    data: Combo;
    init() {
        self.data = Combo{
            first: InnerOne{ foo: 1 },
            second: InnerTwo{ bar: true }
        };
    }
}