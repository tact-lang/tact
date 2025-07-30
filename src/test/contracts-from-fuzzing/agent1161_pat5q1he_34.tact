struct DeepPack {
    a: Int;
    b: String;
    c: Cell;
    d: Address;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
    k: Slice?;
}

contract StoreDeep {
    pack: DeepPack;

    init() {
        self.pack = DeepPack{
            a:1, b:"x", c:emptyCell(), d:myAddress(), e:emptyCell().asSlice(),
            f:null, g:null, h:null, i:null, j:null, k:null
        };
    }
}