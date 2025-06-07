struct StructA {
    inner: StructB;
}

struct StructB {
    inner: StructC;
}

struct StructC {
    inner: StructD;
}

struct StructD {
    inner: StructE;
}

struct StructE {
    val: Int;
}

contract TestContract {
    nested: StructA;

    init() {
        self.nested = StructA{
            inner: StructB{
                inner: StructC{
                    inner: StructD{
                        inner: StructE{
                            val: 101
                        }
                    }
                }
            }
        };
    }
}