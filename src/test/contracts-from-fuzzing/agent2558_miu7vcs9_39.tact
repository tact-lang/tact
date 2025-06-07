struct InnerLayer {
    a: Int;
    b: String;
}
struct MiddleLayer {
    x: InnerLayer;
}
struct OuterLayer {
    y: MiddleLayer;
}

contract Multilayer {
    z: OuterLayer;
    
    init() {
        self.z = OuterLayer{
            y: MiddleLayer{
                x: InnerLayer{
                    a: 123,
                    b: "deep"
                }
            }
        };
    }
}