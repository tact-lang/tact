struct BigData {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract DiverseStorage {
    big: BigData;

    init() {
        self.big = BigData{
            a:1,b:true,c:"hi",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
    receive() {
        let _ = self.big;
    }
}