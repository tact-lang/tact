struct OptStructInner {
    val: Int?;
}

struct OptStructOuter {
    inner: OptStructInner?;
}

contract TestOptStructs {
    f: OptStructOuter;
    init() {
        self.f = OptStructOuter{ inner: null };
    }
}