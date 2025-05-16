struct Inner {
    flag: Bool;
    count: Int;
}

const EMPTY_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
const EMPTY_SLICE: Slice = slice("te6cckEBAQEAAgAAAEysuc0=");

contract ManyFields {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    e: Cell = EMPTY_CELL;
    f: Slice = EMPTY_SLICE;
    g: Int? = null;
    h: Bool? = null;
    i: String? = null;
    j: Address? = null;
    k: Cell? = null;
    l: Slice? = null;
    m: Inner = Inner { flag: false, count: 0 };
    n: Inner? = null;
    o: Int as uint32 = 0;
    p: Int as int64 = 0;
    q: Int as coins = 0;
    r: Int as int257 = 0;
    s: Int? as uint32 = null;
    t: Int? as int64 = null;
    u: Int? as coins = null;
    v: Int? as int257 = null;

    init() {}
}
