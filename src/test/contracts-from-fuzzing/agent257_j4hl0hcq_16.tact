struct N {
    x: Int;
}

contract InitViaInit {
    f: N;
    init() {
        self.f = N{x: 123};
    }
}