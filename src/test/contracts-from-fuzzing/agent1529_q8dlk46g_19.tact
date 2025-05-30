struct Slevel1 { f: Int; }
struct Slevel2 { x: Slevel1; }
contract NestedInline {
    s: Slevel2;
    init() {
        self.s = Slevel2{ x: Slevel1{ f: 7 } };
    }
}
