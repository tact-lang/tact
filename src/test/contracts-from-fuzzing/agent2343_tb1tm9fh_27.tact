struct Lvl3 {
    x: Int;
}

struct Lvl2 {
    nested: Lvl3?;
}

struct Lvl1 {
    inner: Lvl2?;
}

contract DeepChainNullable {
    chain: Lvl1;

    init() {
        self.chain = Lvl1{ inner: null };
    }
}
