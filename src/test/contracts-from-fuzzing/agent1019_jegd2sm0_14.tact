struct Nested1 { v: Int = 1; }
struct Nested2 { w: Bool = false; }
struct Nested3 { s: String = "hi"; }

struct Combo {
    a: Nested1 = Nested1{};
    b: Nested2 = Nested2{};
    c: Nested3 = Nested3{};
    x: Int = 5;
    y: Bool = true;
    z: String = "ok";
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{};
    }
}