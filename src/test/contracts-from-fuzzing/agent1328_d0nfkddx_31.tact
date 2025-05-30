struct In1 {
    x: Int;
}

struct In2 {
    inner: In1;
}

contract ManyLayerOpt {
    v: In2?;
    init() {
        self.v = null;
    }
}