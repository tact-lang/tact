struct L1 {
    a: Int;
    b: L2;
    c: L3?;
}

struct L2 {
    x: Int?;
    y: Bool;
}

struct L3 {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    persist: L1;

    init() {
        self.persist = L1 {
            a: 5,
            b: L2 { x: null, y: false },
            c: null
        };
    }
}