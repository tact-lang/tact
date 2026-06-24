struct LayerA {
    fa: Bool;
    fb: Int;
}

struct LayerB {
    g: LayerA;
    s: String;
}

struct LayerC {
    h: LayerB;
    i: Int?;
}

contract Multilayer {
    d: LayerC;

    init() {
        self.d = LayerC{h: LayerB{g:LayerA{fa:true,fb:5}, s:"deep"}, i: null};
    }
}