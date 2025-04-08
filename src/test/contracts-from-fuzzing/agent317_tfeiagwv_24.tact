struct BigNested {
    x: Int;
    y: Inner;
}

struct Inner {
    s: String;
    addr: Address;
    cell: Cell;
    flag: Bool;
}

contract LargeNestedTest {
    d: BigNested;

    init() {
        self.d = BigNested{
            x: 1,
            y: Inner{
                s: "abc",
                addr: myAddress(),
                cell: emptyCell(),
                flag: false
            }
        };
    }
}