struct X {
    s: String;
}

struct Y {
    inner: X?;
}

contract TestContract {
    data: Y;

    init() {
        self.data = Y{ inner: null };
    }
}