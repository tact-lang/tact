struct HasAll {
    a: Int;
    b: Bool;
    c: Address?;
    d: String;
    e: Cell;
    f: Slice;
}

contract TestContract {
    data: HasAll;

    init() {
        self.data = HasAll{
            a: 1,
            b: true,
            c: null,
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }

    receive() {
        dump(self.data.a);
    }
}