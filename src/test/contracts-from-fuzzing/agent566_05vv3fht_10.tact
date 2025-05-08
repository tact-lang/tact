struct ManyOptionals {
    a: Int?; b: Bool?; c: String?; d: Cell?; e: Slice?; f: Address?;
    g: Int?; h: Bool?; i: String?; j: Cell?; k: Slice?; l: Address?;
}

contract OptionalBomb {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}
