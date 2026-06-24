struct A {
    n: Int;
    s: String;
    b: Bool;
    c: Cell;
    a: Address;
    sl: Slice;
}

contract ManyFields {
    val: A;

    init() {
        self.val = A{
            n: 1,
            s: "hi",
            b: false,
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice(),
        };
    }
}