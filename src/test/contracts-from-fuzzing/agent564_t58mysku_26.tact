// Struct with many mixed primitive types
struct Primitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
}

contract PrimStore {
    p: Primitives;
    init() {
        self.p = Primitives{
            a: 1,
            b: true,
            c: "foo",
            d: emptyCell(),
            e: myAddress()
        };
    }
    receive() {
        self.p.a += 2;
    }
}