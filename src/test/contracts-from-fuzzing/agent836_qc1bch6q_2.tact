struct Inner {
    flag: Bool = true;
    note: String?;
}

struct Outer {
    inner: Inner;
    id: Int = 42;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{ inner: Inner{ note: null } };
    }
}