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

struct NestedComposed {
    inner1: Combination;
    inner2: Combination;
}

contract NestCombo {
    data: NestedComposed;

    init() {
        let c = Combination{
            a:1,b:true,c:"x",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:beginCell(),h:null,i:null,j:null};
        self.data = NestedComposed{inner1:c, inner2:c};
    }
}
