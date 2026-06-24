struct Lvl3 { v3: Int }
struct Lvl2 { v2: Lvl3 }
struct Lvl1 { v1: Lvl2 }

contract DeepChain {
    nested: Lvl1;

    init() {
        self.nested = Lvl1{ v1: Lvl2{ v2: Lvl3{ v3: 42 } } };
    }
}
