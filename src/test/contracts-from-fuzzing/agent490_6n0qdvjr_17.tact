struct S {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Address;
    f: Cell;
}

contract MixedTypes {
    data: S;
    init() {
        self.data = S{
            a: 1,
            b: "abc",
            c: true,
            d: null,
            e: myAddress(),
            f: emptyCell()
        };
    }
}