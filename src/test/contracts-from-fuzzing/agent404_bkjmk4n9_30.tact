struct InnerX {
    a: Int;
    b: Int;
    c: Int;
}

struct MidX {
    x: InnerX;
    optX: InnerX?;
}

struct OuterX {
    mid: MidX;
    optMid: MidX?;
}

contract DeepLarge {
    data: OuterX;
    init() {
        self.data = OuterX{
            mid: MidX{
                x: InnerX{a:1,b:2,c:3},
                optX: null
            },
            optMid: null
        };
    }
}