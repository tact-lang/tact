struct S1 { a: Int; b: Bool; }
struct S2 { c: Int?; d: Bool; }
contract TestStorage {
    field1: S1;
    field2: S2;

    init() {
        self.field1 = S1{ a: 10, b: true };
        self.field2 = S2{ c: null, d: false };
    }
}