struct Deep1 { a: Int }
struct Deep2 { x: Deep1 }
struct Deep3 { y: Deep2 }
struct Deep4 { z: Deep3 }

contract FourLayers {
    nested: Deep4;
    init() {
        self.nested = Deep4{
            z: Deep3{
                y: Deep2{
                    x: Deep1{ a: 99 }
                }
            }
        };
    }
}
