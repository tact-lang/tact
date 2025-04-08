struct ManyFields { a: Int; b: Bool; c: Cell; d: String; e: Address; f: Slice; g: Builder; h: Int?; i: Bool; j: Cell; k: String; l: Address; m: Slice; n: Builder; o: Int; }

contract TestContract {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            a:1,b:true,c:emptyCell(),d:"hi",e:myAddress(),f:emptyCell().asSlice(),g:beginCell(),h:null,i:false,j:emptyCell(),k:"hello",l:myAddress(),m:emptyCell().asSlice(),n:beginCell(),o:42
        };
    }
}