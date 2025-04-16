// optional complex nested defaults
struct Inner {
    v: Int = 5;
    b: Bool? = null;
}

struct NestedOpt {
    i: Int;
    x: Inner;
    y: Inner?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            i:1,
            x: Inner{},
            y: null
        };
    }
}