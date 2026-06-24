struct MultiNested {
    s: String;
    i: Int;
    opt_s: String?;
    opt_i: Int?;
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    inner_s: String;
    inner_i: Int?;
}

struct Nested2 {
    deep: Deepest;
    flag: Bool;
}

struct Deepest {
    addr: Address;
    cell: Cell;
}

contract Test {
    val: MultiNested;
    init() {
        self.val = MultiNested{
            s:"str",
            i:42,
            opt_s:null,
            opt_i:null,
            nested1: Nested1{inner_s:"inner", inner_i:null},
            nested2: Nested2{deep: Deepest{addr:myAddress(), cell:emptyCell()}, flag:true}
        };
    }
}