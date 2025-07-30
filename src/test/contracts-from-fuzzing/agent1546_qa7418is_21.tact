struct ManyFields {
    a: Int; b: Bool; c: String; d: Cell; e: Address;
    f: Int?; g: Bool?; h: String?; i: Cell?; j: Address?;
    k: Int; l: Bool; m: String; n: Cell; o: Address;
    p: Int?; q: Bool?; r: String?; s: Cell?; t: Address?;
}

contract LargeStored {
    val: ManyFields;
    init() {
        self.val = ManyFields{
            a:1,b:true,c:"c",d:emptyCell(),e:myAddress(),
            f:null,g:null,h:null,i:null,j:null,
            k:2,l:false,m:"m",n:emptyCell(),o:myAddress(),
            p:null,q:null,r:null,s:null,t:null
        };
    }
}
