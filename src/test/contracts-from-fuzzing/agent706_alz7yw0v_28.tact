struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
    inner: StructA;
}

struct StructC {
    c: Int;
    inner: StructB;
}

struct StructD {
    d: Int;
    inner: StructC;
}

contract TestContract {
    val: StructD;

    init() {
        self.val = StructD{
            d: 10,
            inner: StructC{
                c: 20,
                inner: StructB{
                    b: 30,
                    inner: StructA{
                        a: 40
                    }
                }
            }
        };
    }
}