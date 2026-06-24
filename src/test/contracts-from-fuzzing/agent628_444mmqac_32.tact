struct BigMix {
    a:Int;
    b:String;
    c:Bool?;
    d:Int;
    e:String?;
    f:Bool;
    g:Int?;
}

contract AllMixed {
    data: BigMix;

    init() {
        self.data = BigMix{ a:1, b:"b", c:null, d:42, e:null, f:true, g:null };
    }
}