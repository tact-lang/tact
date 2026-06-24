// multiple simple structs with various compositions
struct S1 { f: Int; }
struct S2 { s1: S1; g: Bool; }
contract StructTower {
    data: S2;

    init() {
        self.data = S2{ s1: S1{ f:5 }, g:true };
    }
}