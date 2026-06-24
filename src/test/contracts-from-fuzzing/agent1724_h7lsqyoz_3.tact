struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int;
    h: Bool;
    i: String;
    j: Slice;
    k: Cell;
    l: Address;
    m: Bool;
    n: Int;
    o: String;
}

contract TestContract {
    bigData: LargeStruct;
    init() {
        self.bigData = LargeStruct{
            a:1, b:true, c:"hi", d:emptyCell().asSlice(), e:emptyCell(), f:myAddress(),
            g:2, h:false, i:"world", j:emptyCell().asSlice(), k:emptyCell(), l:myAddress(),
            m:true, n:3, o:"done"
        };
    }
}
