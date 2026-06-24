struct MultiFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String;
    i: Bool?;
    j: Address;
    k: Cell;
    l: Slice;
    m: Int;
    n: String;
    o: Bool;
    p: Address;
}

contract LongStructContract {
    stuff: MultiFields;

    init() {
        self.stuff = MultiFields{
            a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:null,
            h:"x", i:false, j:myAddress(), k:emptyCell(), l:emptyCell().asSlice(),
            m:77, n:"z", o:false, p:myAddress()
        };
    }
}