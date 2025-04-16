struct Combo {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
    g: Int?; h: Bool?; i: String?; j: Address?; k: Cell?; l: Slice?;
}
contract ComboContract {
    state: Combo;
    init() {
        self.state = Combo{
            a:1,b:true,c:"s",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:2,h:false,i:"t",j:null,k:null,l:null
        };
    }
}