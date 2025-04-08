struct DeepAnn {
    a: Int as uint8;
    b: Bool;
    c: String;
}

struct Layered {
    x: DeepAnn;
    y: DeepAnn;
    z: DeepAnn;
}

contract MultiLayerAnn {
    data: Layered;
    init() {
        self.data = Layered{
            x: DeepAnn{a:1,b:true,c:"a"},
            y: DeepAnn{a:2,b:false,c:"b"},
            z: DeepAnn{a:3,b:true,c:"c"}
        };
    }
}