struct Deep3 { z: Int }
struct Deep2 { y: Int; d3: Deep3 }
struct Deep1 { x: Int; d2: Deep2 }

contract DeepNest {
    store: Deep1;

    init() {
        self.store = Deep1{
            x: 1,
            d2: Deep2{
                y: 2,
                d3: Deep3{ z: 3 }
            }
        };
    }

    receive() {
        self.store = Deep1{
            x: self.store.x + 1,
            d2: Deep2{
                y: self.store.d2.y + 1,
                d3: Deep3{ z: self.store.d2.d3.z + 1 }
            }
        };
    }
}