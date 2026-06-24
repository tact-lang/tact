struct ManyTypes {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    val: ManyTypes;
    init() {
        self.val = ManyTypes{
            a:1,b:null,c:"c",d:null,e:true,f:null,
            g:emptyCell(),h:null,i:myAddress(),j:null,k:emptyCell().asSlice(),l:null
        };
    }
}