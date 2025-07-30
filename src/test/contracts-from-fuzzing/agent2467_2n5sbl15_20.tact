struct Bundle { a: Int; b: Bool; c: Address; d: Cell; e: Slice; f: String; g: Int?; }

contract CompositeFields {
    bundle: Bundle;
    init() {
        self.bundle = Bundle{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"hi", g:null
        };
    }
}