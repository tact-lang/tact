struct BigFlat {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
    g: Int?; h: Bool?; i: String; j: Address; k: Cell; l: Slice;
}

contract FlatCombo {
    combo: BigFlat;
    init() {
        self.combo = BigFlat{
            a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:true, i:"again", j:myAddress(), k:emptyCell(), l:emptyCell().asSlice()
        };
    }
}