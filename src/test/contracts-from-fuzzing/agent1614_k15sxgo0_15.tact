struct Ints {
    a: Int as int8;
    b: Int as uint64;
    c: Int as int16;
    d: Int;
    e: Int as uint1;
}

contract Test15 {
    val: Ints;

    init() {
        self.val = Ints{a:1, b:2, c:3, d:4, e:1};
    }
}