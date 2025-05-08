struct FlatMany {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int;
    h: Bool; i: Bool; j: Bool; k: Bool; l: Bool;
    m: String; n: String;
}

contract FlatSpread {
    store: FlatMany;
    init() {
        self.store = FlatMany{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,
            h:true,i:false,j:true,k:false,l:true,
            m:"hi", n:"there"
        };
    }
    receive() {}
}