struct Deep1 { a: Int; b: Bool; }
struct Deep2 { x: String; y: Deep1; }
struct Deep3 { z: Deep2; }

contract Nested3Layers {
    store: Deep3;

    init() {
        self.store = Deep3{
            z: Deep2{
                x: "hi",
                y: Deep1{a:7,b:false}
            }
        };
    }
}
