struct Massive {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Slice;
    l: Cell;
}

contract Test7 {
    storage: Massive;
    init() {
        self.storage = Massive{
            a:1,b:true,c:"A",d:myAddress(),e:emptyCell().asSlice(),f:emptyCell(),
            g:2,h:false,i:"B",j:myAddress(),k:emptyCell().asSlice(),l:emptyCell()
        };
    }
}