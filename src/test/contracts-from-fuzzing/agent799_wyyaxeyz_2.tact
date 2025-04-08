struct Nest2 {
    x: Int;
    y: Bool;
}

struct Nest1 {
    inner: Nest2;
    z: Int?;
}

contract C {
    s: Nest1;
    init() {
        self.s = Nest1 {
            inner: Nest2{ x: 5, y: false },
            z: null
        };
    }
}