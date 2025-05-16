struct Inner {
    val: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ val: null },
            flag: false
        };
    }
}