struct LargeTupleEquivalent {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
    h: Int;
    i: Bool;
    j: Address;
    k: Cell;
    l: Slice;
    m: Builder;
    n: String;
}

contract TupleLikeStorage {
    val: LargeTupleEquivalent;

    init() {
        self.val = LargeTupleEquivalent{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:"a",
            h:2, i:false, j:myAddress(), k:emptyCell(), l:emptyCell().asSlice(), m:beginCell(), n:"b",
        };
    }
}