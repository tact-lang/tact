struct BigFields {
    a: Int; b: Bool; c: String; d: Int; e: Bool; f: String; g: Int; h: Bool; i: String;
}

struct WrapBig {
    f1: BigFields;
    f2: BigFields;
}

contract DoubleBigWrap {
    data: WrapBig;

    init() {
        self.data = WrapBig{
            f1: BigFields{a:1,b:true,c:"a",d:2,e:false,f:"b",g:3,h:true,i:"c"},
            f2: BigFields{a:4,b:false,c:"d",d:5,e:true,f:"e",g:6,h:false,i:"f"}
        };
    }
}