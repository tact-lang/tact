struct Deep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

struct Wrap1 {
    inner: Deep;
}

struct Wrap2 {
    inner: Wrap1;
}

struct Wrap3 {
    inner: Wrap2;
}

struct Wrap4 {
    inner: Wrap3;
}

contract NestedFourTimes {
    w: Wrap4;

    init() {
        self.w = Wrap4{ inner: Wrap3{ inner: Wrap2{ inner: Wrap1{ inner: Deep{ a:1, b:2, c:3, d:4 } } } } };
    }
}
