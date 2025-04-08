// contract with optional primitive + nested struct with *required* field, no init()
struct Inner { v: Int; }

contract Combo {
    o: Bool?;
    s: Inner;

    init() {
        self.o = null;
        self.s = Inner{ v: 17 };
    }
}
