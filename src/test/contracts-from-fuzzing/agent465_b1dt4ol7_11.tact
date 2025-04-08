struct Sub {
    a: Int;
    b: Bool?;
}

struct Wrapper {
    x: Sub;
    y: Sub;
    z: Sub;
}

contract TestContract {
    store: Wrapper;

    init() {
        self.store = Wrapper{
            x: Sub{ a: 1, b: null },
            y: Sub{ a: 2, b: true },
            z: Sub{ a: 3, b: false },
        };
    }
}
