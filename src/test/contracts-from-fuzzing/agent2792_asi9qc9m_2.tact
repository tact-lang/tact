struct A {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Address;
    f: String?;
    g: Slice;
}

contract ManyFields {
    data: A;

    init() {
        self.data = A{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: emptyCell().asSlice(),
        };
    }
}