struct Big {
    s: Int;
    t: String;
    u: Bool;
    v: Int?;
    w: String?;
    x: Bool?;
    y: Slice;
    z: Address;
}

contract Test {
    storage: Big;

    init() {
        self.storage = Big{
            s:1,t:"x",u:true,v:null,w:null,x:null,y:emptyCell().asSlice(),z:myAddress()
        };
    }
}
