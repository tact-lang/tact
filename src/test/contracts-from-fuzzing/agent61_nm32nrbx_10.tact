struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Builder?;
    m: Slice?;
    n: Address?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            a:1,b:true,c:"s",d:emptyCell(),e:beginCell(),f:emptyCell().asSlice(),g:myAddress(),
            h:null,i:true,j:null,k:null,l:null,m:null,n:null
        };
    }
}