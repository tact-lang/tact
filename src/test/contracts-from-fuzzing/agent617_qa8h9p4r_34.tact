struct Wrap {
    s: Inner;
}

struct Inner {
    a: Int = 1;
    b: Bool;
}

contract NestedDefaults2 {
    data: Wrap;
    init() {
        self.data = Wrap{
            s: Inner{ b: true }
        };
    }
}