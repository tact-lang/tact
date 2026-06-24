struct S {a:Int; b:Bool; c:String; d:Address; e:Int?; f:String?; g:Bool?; h:Address?;}

contract Test {
    s: S;
    init() {
        self.s = S{
            a:1,
            b:true,
            c:"x",
            d:myAddress(),
            e:null,
            f:null,
            g:null,
            h:null
        };
    }
}