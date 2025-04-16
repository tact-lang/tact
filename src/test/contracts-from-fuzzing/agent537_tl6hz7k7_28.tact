struct Inner {
    si: String;
    bi: Bool;
}

struct Outer {
    so: String;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ so: "outer", nested: Inner{ si: "inner", bi: false } };
    }

    receive() {
        self.data = self.data;
    }
}
