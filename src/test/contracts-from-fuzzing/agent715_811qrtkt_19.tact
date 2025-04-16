struct X {
    a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool?;
}

struct Y {
    m: X;
    n: X?;
}

contract StructOfStructs {
    data: Y;
    init() {
        self.data = Y{
            m: X{a:1,b:true,c:"hi",d:null,e:null,f:false},
            n: null
        };
    }
}