struct InnerMostX {
    a:Int; b:Int; c:Int;
}

struct MiddleX {
    im:InnerMostX; x:Int;
}

struct OuterX {
    m:MiddleX; y:Int?;
}

contract DeepChain {
    data: OuterX;
    init() {
        self.data = OuterX{
            m: MiddleX{
                im:InnerMostX{a:1,b:2,c:3},
                x:4
            },
            y:null
        };
    }
}
