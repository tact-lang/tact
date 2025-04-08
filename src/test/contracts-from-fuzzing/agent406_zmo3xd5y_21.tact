struct N1 { f: Int = 1; }
struct N2 { s: String = "a"; }
struct MultiWrap {
    nn1: N1 = N1{};
    nn2: N2 = N2{};
}

contract MultiDefaultTest {
    store: MultiWrap;
    init() {
        self.store = MultiWrap{};
    }
}