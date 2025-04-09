struct SInner {
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

struct SMid {
    x: SInner;
    y: SInner?;
    z: SInner;
}

contract MassiveNested {
    mid: SMid;

    init() {
        self.mid = SMid{
            x: SInner{
                a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"hi",
                g:null,h:null,i:null,j:null,k:null,l:null
            },
            y: null,
            z: SInner{
                a:2,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"bye",
                g:null,h:null,i:null,j:null,k:null,l:null
            }
        };
    }
}