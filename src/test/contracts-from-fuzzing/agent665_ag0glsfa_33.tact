struct LayerA { x: Int; }
struct LayerB { y: Int?; }

struct LayerC {
  la: LayerA;
  lb: LayerB;
}

contract CrossOptional {
    nested: LayerC = LayerC{
        la: LayerA{x:5}, lb: LayerB{y:null}
    };

    init() {
        self.nested = self.nested;
    }

    receive() {
        let _ = self.nested;
    }
}