struct IntPair {
    a: Int;
    b: Int;
}

struct Nested {
    np1: IntPair;
    np2: IntPair;
}

contract TestContract {
    nfield: Nested;

    init() {
        self.nfield = Nested{
            np1: IntPair{a:1,b:2},
            np2: IntPair{a:3,b:4}
        };
    }
}