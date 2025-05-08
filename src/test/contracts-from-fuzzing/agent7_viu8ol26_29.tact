// optional nested struct inside optional struct (single level)
struct L2 {
    v: Int;
}

struct L1 {
    inner: L2?;
}

contract OptionalNested {
    field: L1?;

    init() {
        self.field = null;
    }
}
