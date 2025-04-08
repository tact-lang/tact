struct Layer1 {
    v1: Int;
    v2: Int;
}

struct Layer2 {
    l1a: Layer1;
    l1b: Layer1;
}

struct Layer3 {
    l2a: Layer2;
    l2b: Layer2;
}

contract DeepLayers {
    data: Layer3;
    init() {
        self.data = Layer3 {
            l2a: Layer2 {
                l1a: Layer1 { v1: 1, v2: 2 },
                l1b: Layer1 { v1: 3, v2: 4 }
            },
            l2b: Layer2 {
                l1a: Layer1 { v1: 5, v2: 6 },
                l1b: Layer1 { v1: 7, v2: 8 }
            }
        };
    }
    receive() {
        let _ = self.data.l2b.l1b.v2;
    }
}