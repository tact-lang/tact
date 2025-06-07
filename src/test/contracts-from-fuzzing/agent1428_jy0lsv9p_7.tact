struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool;
    i: String;
    j: Slice;
}

struct MidNested {
    inner: BigNested;
    another: BigNested;
}

contract ComplexStorage {
    data: MidNested;

    init() {
        self.data = MidNested{
            inner: BigNested{
                a:1,b:true,c:"x",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),g:null,h:false,i:"y",j:emptyCell().asSlice()
            },
            another: BigNested{
                a:2,b:false,c:"z",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),g:99,h:true,i:"w",j:emptyCell().asSlice()
            }
        };
    }
}