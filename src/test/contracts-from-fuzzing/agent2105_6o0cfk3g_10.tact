struct NestedStructA {
    inner: NestedStructB;
}

struct NestedStructB {
    inner: NestedStructC;
}

struct NestedStructC {
    inner: NestedStructD;
}

struct NestedStructD {
    value: Int;
}

contract TestContract {
    s: NestedStructA;

    init() {
        self.s = NestedStructA{
            inner: NestedStructB{
                inner: NestedStructC{
                    inner: NestedStructD{
                        value: 123,
                    }
                }
            }
        };
    }
}