struct BigNest {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: String?;
    g: Int?;
    h: Bool?;
    i: Address;
    j: Address?;
}

struct Container {
    nested: BigNest;
}

contract DeepNesting {
    cont: Container;

    init() {
        self.cont = Container{
            nested: BigNest{
                a:1,
                b:true,
                c:"hi",
                d:emptyCell(),
                e:emptyCell().asSlice(),
                f:null,
                g:null,
                h:null,
                i:myAddress(),
                j:null
            }
        };
    }
}