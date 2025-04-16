// optional struct inside struct, which has optional struct inside, assigned both null
struct L3 { val: Int }

struct L2 { sub: L3? }

struct L1 { deeper: L2? }

contract NestedNulls {
    nest: L1;
    init() {
        self.nest = L1{ deeper: null };
    }
}