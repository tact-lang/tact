// multiple layers of nested structs with optionals inside deep
struct L3 { a: Int?; }
struct L2 { b: L3; }
struct L1 { c: L2; }

contract TestContract {
    f: L1;
    init() {
        self.f = L1{ c: L2{ b: L3{ a: null } } };
    }
}
