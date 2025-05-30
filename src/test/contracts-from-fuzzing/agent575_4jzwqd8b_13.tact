struct S {
    a: Int;
    b: Bool;
}

struct Wrapper {
    s: S;
    id: Int;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{ s: S{ a:10, b:true }, id: 1 };
    }
}
