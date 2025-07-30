struct Deep {
    a: Int;
    b: Bool;
}

struct Wrap1 {
    d: Deep?;
}

struct Wrap2 {
    w: Wrap1?;
}

contract TestContract {
    f: Wrap2;

    init() {
        self.f = Wrap2{ w: Wrap1{ d: Deep{ a: 42, b: true } } };
    }
}