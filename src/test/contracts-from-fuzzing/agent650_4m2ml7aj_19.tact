// Optionals with defaults at multiple nested struct levels
struct SInner {
    a: Int? = null;
}

struct SMid {
    inner: SInner? = null;
}

struct SOuter {
    mid: SMid? = null;
}

contract TestContract {
    s: SOuter;

    init() {
        self.s = SOuter{};
    }
}
