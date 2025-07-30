struct Combination {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: String?;
    j: Address?;
}

contract ComboContract {
    data: Combination;

    init() {
        self.data = Combination{
            a:1,
            b:true,
            c:"x",
            d:myAddress(),
            e:emptyCell(),
            f:emptyCell().asSlice(),
            g:beginCell(),
            h:null,
            i:null,
            j:null
        };
    }
}
