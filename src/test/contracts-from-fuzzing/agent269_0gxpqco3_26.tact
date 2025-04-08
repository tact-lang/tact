struct In1 { x: Int = 1; }
struct In2 { y: In1 = In1{}; }
struct In3 { z: In2 = In2{}; }
struct In4 { q: In3 = In3{}; }

contract LargeNested {
    t: In4 = In4{};

    init() {
        self.t = In4{};
    }
}