struct IntsA {
    a: Int;
}

struct IntsB {
    b: Int;
    inner: IntsA;
}

struct IntsC {
    c: Int;
    inner: IntsB;
}

contract NestedIntContract {
    data: IntsC;

    init() {
        self.data = IntsC{
            c: -1,
            inner: IntsB{
                b: -2,
                inner: IntsA{ a: -3 }
            }
        };
    }
}