struct Layer3 {
    attr3: Int;
}

struct Layer2 {
    attr2: Layer3;
}

struct Layer1 {
    attr1: Layer2;
}

struct Layer0 {
    attr0: Layer1;
}

contract FourLayers {
    persistent: Layer0;
    init() {
        self.persistent = Layer0{attr0: Layer1{attr1: Layer2{attr2: Layer3{attr3: 5}}}};
    }
}