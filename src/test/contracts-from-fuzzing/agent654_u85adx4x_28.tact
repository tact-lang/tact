message M {}

struct Inner {
    m: M;
}

contract C {
    data: Inner;

    init() {
        self.data = Inner{ m: M{} };
    }
}