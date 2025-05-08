struct Plurals {
    a: Int; b: Bool; c: String; d: Cell; e: Slice;
    f: Int?; g: Bool?; h: String?; i: Cell?; j: Slice?;
}

contract PluralFields {
    p: Plurals;
    init() {
        self.p = Plurals{
            a:1,b:true,c:"hi",d:emptyCell(),e:emptyCell().asSlice(),
            f:null,g:null,h:null,i:null,j:null
        };
    }
}