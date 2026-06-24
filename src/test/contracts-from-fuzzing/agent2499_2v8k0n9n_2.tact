struct Inner {
    z: Int?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{z: null}, flag: true };
    }
}
