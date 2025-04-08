struct SInner {
    flag: Bool;
}
struct SOuter {
    inner: SInner;
}

contract TestContract {
    data: SOuter?;

    init() {
        self.data = SOuter{ inner: SInner{ flag: false }};
    }
}