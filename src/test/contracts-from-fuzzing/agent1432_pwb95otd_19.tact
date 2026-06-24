struct Inner {
    strA: String;
    addrA: Address;
    strB: String;
    addrB: Address;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner1: Inner{
                strA: "foo", addrA: myAddress(),
                strB: "bar", addrB: myAddress()
            },
            inner2: Inner{
                strA: "baz", addrA: myAddress(),
                strB: "qux", addrB: myAddress()
            }
        };
    }
}