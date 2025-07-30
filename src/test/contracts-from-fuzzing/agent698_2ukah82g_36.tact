struct Small {
    x: Int;
}

struct Wrap1 {
    inner: Small;
}

struct Wrap2 {
    inner: Wrap1;
}

struct Wrap3 {
    inner: Wrap2;
}

contract TestContract {
    deep: Wrap3;

    init() {
        self.deep = Wrap3{ inner: Wrap2{ inner: Wrap1{ inner: Small{ x:42 } } } };
    }
}