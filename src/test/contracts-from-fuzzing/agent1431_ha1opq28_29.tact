// Large flattened persistent struct with many primitive fields
struct LargeFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
}

contract TestContract {
    data: LargeFlat;

    init() {
        self.data = LargeFlat{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: false,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null
        };
    }
}