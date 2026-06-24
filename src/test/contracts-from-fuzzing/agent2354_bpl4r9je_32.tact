struct BigS {
    a: Int as int8; b: Int as int16; c: Int as int32; d: Int as int64;
    e: Int as int128; f: Int as int257; g: Int; h: Bool; i: String;
    j: Cell; k: Slice; l: Address; m: Int?; n: Bool?; o: String?;
    p: Cell?; q: Slice?; r: Address?;
}

contract BigStructInContract {
    data: BigS;

    init() {
        self.data = BigS{
            a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:true, i:"hi",
            j:emptyCell(), k:emptyCell().asSlice(), l:myAddress(),
            m:null, n:null, o:null, p:null, q:null, r:null
        };
    }
}