struct BigDeep {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Slice;
    k: Cell?;
    l: Address?;
}

contract MultiTypeContract {
    state: BigDeep;

    init() {
        self.state = BigDeep{
            a:1, b:true, c:"x", d:emptyCell().asSlice(), e:emptyCell(), f:myAddress(),
            g:null,h:null,i:null,j:emptyCell().asSlice(),k:null,l:null
        };
    }
}