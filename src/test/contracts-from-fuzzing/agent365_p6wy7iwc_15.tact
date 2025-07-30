struct S {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
}

contract MixedPrimitiveFields {
    data: S;
    init() {
        self.data = S{
            a:1,
            b:true,
            c:emptyCell(),
            d:myAddress()
        };
    }
}