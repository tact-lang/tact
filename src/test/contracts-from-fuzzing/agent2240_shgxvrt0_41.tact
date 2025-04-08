struct Lvl3 { x: Int; }
struct Lvl2 { inner: Lvl3; }
struct Lvl1 { mid: Lvl2; }

contract Nested3Layer {
    data: Lvl1;
    init() {
        self.data = Lvl1{ mid: Lvl2{ inner: Lvl3{ x: 42 } } };
    }
}