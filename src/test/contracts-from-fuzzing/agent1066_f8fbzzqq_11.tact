struct Tiny {
    x: Int;
}

struct Mid {
    t: Tiny;
    y: Int;
}

struct Big {
    m: Mid;
    z: Int;
}

contract StorageTest {
    dat: Big;

    init() {
        self.dat = Big{m: Mid{t: Tiny{x: 1}, y: 2}, z: 3};
    }
}