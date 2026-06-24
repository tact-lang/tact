struct AAA {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Builder;
    l: Builder?;
    m: Slice;
    n: Slice?;
}

contract TestContract {
    data: AAA;

    init() {
        self.data = AAA{
            a:1,b:true,c:"c",d:null,e:false,f:null,g:myAddress(),h:null,
            i:emptyCell(),j:null,k:beginCell(),l:null,m:emptyCell().asSlice(),n:null
        };
    }
}