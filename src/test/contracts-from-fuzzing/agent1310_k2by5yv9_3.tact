struct InnerMost { val: Int; }
struct Mid { inner: InnerMost; }
struct Outer { mid: Mid; }

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{ mid: Mid{ inner: InnerMost{ val: 123 } } };
    }
}
