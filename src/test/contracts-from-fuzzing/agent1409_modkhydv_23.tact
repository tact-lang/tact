struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract Test {
    m: ManyTypes;
    init() {
        self.m = ManyTypes{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"x",
            g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
    receive(){ let _=self.m.a; }
}