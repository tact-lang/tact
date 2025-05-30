// Struct with huge number of mixed optional and normal
struct ManyMixOpt {
    a:Int;
    b:Int?;
    c:Bool;
    d:String?;
    e:String;
    f:Bool?;
    g:Int;
    h:Int?;
    i:Bool;
    j:String?;
}

contract ManyMixOptPersist {
    s:ManyMixOpt;
    init() {
        self.s = ManyMixOpt{
            a:1, b:null, c:true, d:"d", e:"e",
            f:false, g:7, h:8, i:false, j:null
        };
    }
}