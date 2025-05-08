struct BigFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint32;
    h: Int as int64;
    i: String;
    j: Bool;
    k: Int;
}

contract FlatMix {
    f: BigFlat = BigFlat{
        a:1,b:true,c:"hi",d:null,e:null,f:null,g:1,h:1,i:"bye",j:false,k:0
    };
    receive() {
        let _ = self.f.j;
    }
}