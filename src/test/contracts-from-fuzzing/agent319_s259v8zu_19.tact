struct MixedOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Slice;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract TestContract {
    storage: MixedOrder;

    init() {
        self.storage = MixedOrder{
            a:1, b:true, c:"hi", d:null, e:null,
            f:emptyCell().asSlice(), g:emptyCell(), h:null,
            i:myAddress(), j:null
        };
    }
}