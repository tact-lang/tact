struct S {
    s: String?;
}

contract TestContract {
    f: S;

    init() {
        self.f = S{ s: null };
    }

    receive() {
        self.f = S{ s: "hello" };
    }
}