struct A {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract ManyFieldStruct {
    data: A;

    init() {
        self.data = A{
            a: 1,
            b: false,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
        };
    }
}