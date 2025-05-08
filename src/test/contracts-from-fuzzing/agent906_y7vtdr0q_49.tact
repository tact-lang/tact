struct WithAddress {
    addr: Address;
}

struct WithCell {
    cl: Cell;
}

struct WithString {
    st: String;
}

contract ManyPrimitives {
    a: WithAddress;
    b: WithCell;
    c: WithString;

    init() {
        self.a = WithAddress{ addr: myAddress() };
        self.b = WithCell{ cl: emptyCell() };
        self.c = WithString{ st: "hi" };
    }
}