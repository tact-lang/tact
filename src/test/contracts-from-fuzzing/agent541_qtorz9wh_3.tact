struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Outer {
    nested1: Inner;
    nested2: Inner?;
    optionalStr: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{ val1: 10, val2: true },
            nested2: null,
            optionalStr: null,
        };
    }

    receive() {
        self.data = self.data;
    }
}