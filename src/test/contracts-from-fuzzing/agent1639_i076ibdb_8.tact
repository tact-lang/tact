struct SuperWide {
    a: Int;   aa: Int;  ab: Int;  ac: Int;
    b: Bool;  ba: Bool; bb: Bool; bc: Bool;
    c: Int?;  ca: Int?; cb: Int?; cc: Int?;
    d: Bool?; da: Bool?; db: Bool?; dc: Bool?;
    e: Int;   ea: Int;  eb: Int;  ec: Int;
    f: Bool;  fa: Bool; fb: Bool; fc: Bool;
    g: Int?;  ga: Int?; gb: Int?; gc: Int?;
    h: Bool?; ha: Bool?; hb: Bool?; hc: Bool?;
}

contract TestContract {
    big: SuperWide;

    init() {
        self.big = SuperWide{
            a:1, aa:2, ab:3, ac:4,
            b:true, ba:false, bb:true, bc:false,
            c:null, ca:5, cb:null, cc:6,
            d:true, da:null, db:false, dc:null,
            e:7, ea:8, eb:9, ec:10,
            f:true, fa:false, fb:true, fc:true,
            g:11, ga:null, gb:12, gc:null,
            h:false, ha:true, hb:null, hc:true
        };
    }
}