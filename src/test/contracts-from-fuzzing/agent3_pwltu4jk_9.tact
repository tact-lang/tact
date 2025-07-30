// Large struct with mixed fields
struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Cell?;
    k: Slice?;
    l: Address?;
    m: Int;
    n: String;
}

contract ManyStructs {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress(),
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: myAddress(),
            m: 99,
            n: "end"
        };
    }
}