struct S {
    x: Int;
}

message(5) M {
    s: S;
}

struct Wrap {
    m: M;
}

contract TestContract {
    data: Wrap?;

    init() {
        self.data = null;
    }
}
