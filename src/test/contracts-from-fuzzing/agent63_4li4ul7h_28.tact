struct BigOne {
    a:Int;
    b:Bool;
    c:String;
    d:Int as uint32;
    e:Bool?;
    f:String?;
    g:Int?;
}

contract WrapperBigOne {
    data: BigOne;

    init() {
        self.data = BigOne {
            a:1,
            b:true,
            c:"abc",
            d:42,
            e:null,
            f:null,
            g:null
        };
    }
}
