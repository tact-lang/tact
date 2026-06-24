// Optional nested struct inside an optional struct
struct SInner {
    a: Int?
}

struct SOuter {
    inner: SInner?;
    b: Int?;
}

contract TestContract {
    s: SOuter;

    init() {
        self.s = SOuter{ inner: null, b: null };
    }
}