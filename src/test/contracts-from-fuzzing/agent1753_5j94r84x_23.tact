struct LVL3 { f: Int }

struct LVL2 { x: LVL3 }

struct LVL1 { s: LVL2 }

contract Embed3L {
    nested: LVL1;
    init() {
        self.nested = LVL1{ s: LVL2{ x: LVL3{ f: 1 } } };
    }
}