struct Cont1 { a: Int; b: Int; }
struct Cont2 { c: Bool; d: String; e: Cont1; }
contract TestContract {
    f: Cont2;
    init() {
        self.f = Cont2{ c: true, d: "d", e: Cont1{ a: 1, b: 2 } };
    }
}
