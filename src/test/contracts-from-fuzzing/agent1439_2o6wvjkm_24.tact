struct AllPrims {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

struct NestedAllPrims {
    prims: AllPrims;
}

contract TestNestedAllPrims {
    store: NestedAllPrims;

    init() {
        self.store = NestedAllPrims{
            prims: AllPrims{
                a:0,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"hi"
            }
        };
    }
}