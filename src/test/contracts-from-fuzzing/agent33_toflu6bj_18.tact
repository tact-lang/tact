struct VeryOdd {
    a: Int as int3;
    b: Int as uint5;
    c: Int as int9;
}

struct Wrap {
    inner: VeryOdd;
    x: Int;
}

contract TestContract {
    val: Wrap;

    init() {
        self.val = Wrap{
            inner: VeryOdd{ a: -3, b: 5, c: -7 },
            x: 42
        };
    }
}