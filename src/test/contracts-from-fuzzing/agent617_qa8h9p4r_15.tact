struct Wide {
    x1: Int; x2: Bool; x3: Address; x4: Cell; x5: Slice; x6: String;
    y1: Int?; y2: Bool?; y3: Address?; y4: Cell?; y5: Slice?; y6: String?;
}

contract WideFields {
    data: Wide;
    init() {
        self.data = Wide{
            x1:1, x2:true, x3:myAddress(), x4:emptyCell(), x5:emptyCell().asSlice(), x6:"a",
            y1:2, y2:false, y3:myAddress(), y4:emptyCell(), y5:emptyCell().asSlice(), y6:"b"
        };
    }
}