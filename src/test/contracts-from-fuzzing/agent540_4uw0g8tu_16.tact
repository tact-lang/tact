struct Flat {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
}

struct NestedFlat {
    inner1: Flat;
    inner2: Flat;
}

contract NestedStructs {
    val: NestedFlat;

    init() {
        self.val = NestedFlat{
            inner1: Flat{ a: 1, b: true, c: null, d: false },
            inner2: Flat{ a: 2, b: false, c: null, d: true }
        };
    }
}