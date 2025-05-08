struct InnerX {
    foo: Int?;
}

struct OuterY {
    bar: InnerX?;
}

contract BugContract {
    state: OuterY;

    init() {
        self.state = OuterY{ bar: InnerX{ foo: 7 } };
    }
}