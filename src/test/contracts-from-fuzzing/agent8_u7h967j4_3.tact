struct Deep3 { z: Int; }
struct Deep2 { y: Deep3; }
struct Deep1 { x: Deep2; }

contract DeepNest {
    var: Deep1;

    init() {
        self.var = Deep1{ x: Deep2{ y: Deep3{ z: 777 } } };
    }
}