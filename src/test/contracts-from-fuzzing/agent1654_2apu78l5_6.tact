struct InnerOpt {
    val: Int?;
}

struct Outer {
    inner: InnerOpt;
    flag: Bool;
}

contract TestContract {
    saved: Outer;
    init() {
        self.saved = Outer{ inner: InnerOpt{val: null}, flag: true };
    }
}