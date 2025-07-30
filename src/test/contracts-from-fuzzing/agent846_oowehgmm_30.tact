// test optional struct field
struct SOpt {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract Test {
    v: SOpt;

    init() {
        self.v = SOpt{ inner: null };
    }
}