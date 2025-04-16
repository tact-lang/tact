struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell?;
}

const EMPTY: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
const ZEROADDR: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

contract StructFieldTest {
    data: BigNested = BigNested {
        a: 1,
        b: "text",
        c: true,
        d: EMPTY,
        e: EMPTY,
        f: ZEROADDR,
        g: null,
        h: null,
        i: "abc",
        j: null
    };
    init() {}
}