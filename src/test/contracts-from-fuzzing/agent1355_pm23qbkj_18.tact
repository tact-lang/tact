struct LayerA {
    a: Int;
    b: String;
}
struct LayerB {
    ca: LayerA;
    d: Bool;
}
struct LayerC {
    cb: LayerB;
    e: Int;
}
contract DeepChain {
    data: LayerC;
    init() {
        self.data = LayerC{
            cb: LayerB{
                ca: LayerA{
                    a: 5,
                    b: "hi"
                },
                d: true
            },
            e: -7
        };
    }
}