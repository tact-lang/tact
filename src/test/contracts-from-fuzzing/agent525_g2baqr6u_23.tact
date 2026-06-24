// extreme integer serialization limits,
// test int1 and uint1 persistence
contract Test {
    s1: Int as int1 = 0;
    s2: Int as uint1 = 1;

    init() {
        self.s1 = 1;   // 1 for int1 (edge)
        self.s2 = 0;   // 0 for uint1 (edge)
    }
}
