struct Inner {
    val: Int;
}

struct Outer {
    i: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            i: Inner{ val: 99 },
            flag: true
        };
    }
}