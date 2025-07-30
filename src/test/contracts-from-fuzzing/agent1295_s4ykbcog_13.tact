// Large contract field: a struct with a wide set of primitive types
struct Mega {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Builder?;
    m: Address?;
}

contract TestMega {
    val: Mega;

    init() {
        self.val = Mega{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: beginCell(),
            f: emptyCell().asSlice(),
            g: "hello",
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null
        };
    }
}