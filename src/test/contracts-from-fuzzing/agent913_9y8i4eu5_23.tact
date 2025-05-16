// Large struct with mixed types, including multiple optionals and primitives

struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Builder;
    l: Builder?;
    m: Address;
    n: Address?;
}

contract TestContract {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "test",
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: beginCell(),
            l: null,
            m: myAddress(),
            n: null
        };
    }
}