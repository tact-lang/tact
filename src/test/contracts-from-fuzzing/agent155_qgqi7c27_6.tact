struct S1 { x: Int; }
struct S2 { s1: S1?; y: Bool; }
contract NestedOptional {
    data: S2;
    init() {
        self.data = S2{s1: null, y: true};
    }
}