struct OptIntLayer3 { a: Int?; }
struct OptIntLayer2 { b: OptIntLayer3?; }
struct OptIntLayer1 { c: OptIntLayer2?; }

contract DeepOptionalInt {
    v: OptIntLayer1;

    init() {
        self.v = OptIntLayer1 { c: null };
    }
}