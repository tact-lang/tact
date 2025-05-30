struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;

    f: InnerNested;
}

struct InnerNested {
    g: Int;
    h: Int?;
    i: String;
    j: Slice?;
}

contract ContractWithLargeNested {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a:1, b:true, c:"A", d:emptyCell(), e:emptyCell().asSlice(),
            f: InnerNested{
                g:2, h:null, i:"B", j:null
            }
        };
    }
}