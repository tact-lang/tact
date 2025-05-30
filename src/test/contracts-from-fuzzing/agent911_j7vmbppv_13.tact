struct LayerA {
    a: Int;
    b: LayerB;
}
struct LayerB {
    c: Int;
    d: LayerC;
}
struct LayerC {
    e: Int;
    f: String;
    g: Bool;
}

contract TestLayers {
    payload: LayerA;

    init() {
        self.payload = LayerA{
            a:1,
            b: LayerB{
                c:2,
                d: LayerC{
                    e:3,
                    f:"hey",
                    g:true
                }
            }
        };
    }
}