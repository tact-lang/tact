struct BigOptionLayer {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: String?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract BigOptionalsTest {
    val: BigOptionLayer;

    init() {
        self.val = BigOptionLayer{a:null,b:null,c:null,d:null,e:null,f:null,g:null};
    }
}