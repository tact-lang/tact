struct VastStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;
    h: String?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Int?;
    m: Slice?;
}

contract VastContract {
    field: VastStruct;

    init() {
        self.field = VastStruct{
            a: 1, b: true, c: "hi", d: emptyCell(), e: myAddress(), f: emptyCell().asSlice(), g: beginCell(),
            h: null, i: null, j: null, k: null, l: null, m: null,
        };
    }
}