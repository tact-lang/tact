struct Crazy {
    a: Int; b: Bool; c: String; d: Int?;
    e: Bool?; f: String?; g: Address; h: Slice;
    i: Int as uint32; j: Int as coins; k: String?;
}

contract StructMixHuge {
    s: Crazy;
    init() {
        self.s = Crazy{
            a:1, b:true, c:"test", d:null,
            e:true, f:null, g:myAddress(), h:emptyCell().asSlice(),
            i:999, j:ton("5"), k:"hello"
        };
    }
}