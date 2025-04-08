struct Wrap {
    x: Int;
}

contract TestContract {
    f: Wrap?;

    init() {
        self.f = Wrap{x:42};
    }
}
