struct Inner { val: Int; }
struct Wrapper { optInner: Inner?; }

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{ optInner: null };
    }
}