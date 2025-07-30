struct Overloaded {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: Address;
    h: Int?;
    i: Bool;
    j: String?;
    k: Cell;
    l: Slice?;
    m: Address?;
    n: Int?;
}

contract OverloadedStruct {
    val: Overloaded;
    init() {
        self.val = Overloaded{
            a:1, b:false, c:"hi", d:null, 
            e:emptyCell(), f:emptyCell().asSlice(), g:myAddress(), 
            h:null, i:true, j:null, k:emptyCell(), l:null, m:null, n:null
        };
    }
}