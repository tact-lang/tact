struct Inner {
    val: Int?;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract DeepTest {
    data: Outer;
    init() {
        self.data = Outer{ mid: Mid{ inner: Inner{ val: null } } };
    }
}