struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Address?;
}

struct Container {
    inner: BigNested;
    inner2: BigNested;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            inner: BigNested{
                a:1,b:true,c:"x",d:emptyCell(),e:emptyCell().asSlice(),f:beginCell(),g:myAddress(),
                h:null,i:null,j:null,k:null,l:null,m:null
            },
            inner2: BigNested{
                a:2,b:false,c:"y",d:emptyCell(),e:emptyCell().asSlice(),f:beginCell(),g:myAddress(),
                h:null,i:null,j:null,k:null,l:null,m:null
            }
        };
    }
}