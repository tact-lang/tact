struct S1 { f1: Int as int8; f2: Bool; }
struct S2 { s1: S1; opt_s1: S1?; int_val: Int; }

contract StructFieldsTest {
    data: S2;

    init() {
        self.data = S2{
            s1: S1{ f1: 1, f2: true },
            opt_s1: null,
            int_val: 42
        };
    }
}