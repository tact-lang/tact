struct NestedPrims {
    p: Prim;
}

struct Prim {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;
    g: Address;
}

contract NestedPrimsContract {
    data: NestedPrims;
    init() {
        self.data = NestedPrims{
            p: Prim{
                a:1,b:true,c:"x",d:emptyCell(),e:beginCell(),f:emptyCell().asSlice(),g:myAddress()
            }
        };
    }
}