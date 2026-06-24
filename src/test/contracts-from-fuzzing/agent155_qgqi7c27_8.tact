struct S {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Address;
}

contract MixedTypes {
    s: S;
    init() {
        self.s = S{
            a: 1,
            b: null,
            c: "Hello",
            d: emptyCell(),
            e: myAddress(),
        };
    }
}