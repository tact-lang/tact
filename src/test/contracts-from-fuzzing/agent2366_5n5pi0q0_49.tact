// test recursive optional
struct X {
    a: Int;
}

struct Wrap {
    inner: X?;
}

contract RecursiveOptWrap {
    field: Wrap?;

    init() {
        self.field = null;
    }
}