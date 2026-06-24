struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Int?;
    f: Cell;
    g: Slice;
    h: Bool?;
    i: String;
    j: Address?;
    k: Int;
    l: Bool;
    m: String;
    n: Bool?;
    o: Int;
}

contract TestLong {
    val: LongStruct;
    
    init() {
        self.val = LongStruct{
            a: 1, b: false, c: "cc", d: null, e: 5, f: beginCell().endCell(), g: beginCell().endCell().asSlice(),
            h: true, i: "ii", j: myAddress(), k: 3, l: true, m: "mm", n: false, o: 4
        };
    }
}