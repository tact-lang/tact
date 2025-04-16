struct SInner {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

struct SMiddle {
    x: SInner;
    y: SInner;
}

contract NestedMany {
    z: SMiddle;

    init() {
        self.z = SMiddle{
            x: SInner{
                a:1,b:true,c:"a",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress()
            },
            y: SInner{
                a:2,b:false,c:"b",d:emptyCell().asSlice(),e:emptyCell(),f:myAddress()
            }
        };
    }
}
