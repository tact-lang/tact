struct LayerA {
    foo: Int;
}

struct LayerB {
    a: LayerA;
    flag: Bool;
}

struct LayerC {
    b: LayerB;
    text: String;
}

contract MultiLayerMixed {
    val: LayerC;

    init() {
        self.val = LayerC{
            b: LayerB{
                a: LayerA{ foo: 123 },
                flag: true
            },
            text: "hey"
        };
    }
}