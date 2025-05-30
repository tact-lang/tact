struct Prims {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
}

contract TestContract {
    data: Prims;

    init() {
        self.data = Prims{
            i: 1,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "hello"
        };
    }
}