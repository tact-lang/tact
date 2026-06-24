struct TinyLayer1 {
    x: Int;
}

struct TinyLayer2 {
    y: Int;
    t1: TinyLayer1;
}

contract TinyDeep {
    store: TinyLayer2;

    init() {
        self.store = TinyLayer2{ y:1, t1:TinyLayer1{ x:2 } };
    }
}