// large multi-level nested mixed optional struct with strings, bools, ints
struct InnerMost {
    f1: Int; f2: String?; f3: Bool;
}
struct InnerLayer {
    s1: String; s2: Bool?; s3: InnerMost;
}
struct MiddleLayer {
    x: Int?; y: InnerLayer; z: Bool;
}
struct OuterLayer {
    alpha: MiddleLayer?; beta: Bool;
}

contract Fuzz {
    data: OuterLayer;
    init() {
        self.data = OuterLayer{
            alpha: MiddleLayer{
                x:null,
                y: InnerLayer{
                    s1: "hi",
                    s2: null,
                    s3: InnerMost{f1:1, f2:null, f3:true}
                },
                z: false
            },
            beta:true
        };
    }
}