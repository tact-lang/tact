struct Container {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

struct Wrapper {
    w: Container;
}

contract StructInStruct {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            w: Container{
                a:1,
                b:true,
                c:myAddress(),
                d:emptyCell(),
                e:emptyCell().asSlice(),
                f:"hi",
                g:null,
                h:null,
                i:null,
                j:null,
                k:null,
                l:null
            }
        };
    }
}