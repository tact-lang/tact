struct Wide {
    a: Int; b: Int?; c: Bool; d: Bool?;
    e: Int as uint8; f: Int?; g: String; h: String?;
    i: Cell; j: Cell?; k: Slice; l: Slice?;
    m: Address; n: Address?; o: Int as int64;
}

contract TestContract {
    wide: Wide;

    init() {
        self.wide = Wide{
            a:1, b:null, c:true, d:false,
            e:5, f:6, g:"hi", h:null,
            i:emptyCell(), j:null, k:emptyCell().asSlice(), l:null,
            m:myAddress(), n:null, o:-12345
        };
    }
}
