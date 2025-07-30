struct Deep {
    inner: Nested;
    ok: Bool;
}

struct Nested {
    flag: Bool;
    number: Int as uint32;
}

contract TestContract {
    deepData: Deep = Deep{ inner: Nested{ flag: true, number: 1 }, ok: false };

    init() {
        self.deepData = Deep{ inner: Nested{ flag: false, number: 42 }, ok: true };
    }

    receive() {
        // dummy
    }
}