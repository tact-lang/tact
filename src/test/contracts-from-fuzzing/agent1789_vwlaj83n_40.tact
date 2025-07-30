struct Inner {
    x: Int;
    y: Bool;
}

struct Wrapper {
    nested: Inner;
}

contract StructWrapper {
    data: Wrapper;

    init() {
        self.data = Wrapper{ nested: Inner{ x:42, y:true } };
    }
}