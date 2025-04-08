struct InnerMost {
    a: Int;
    b: Bool;
    c: String?;
}

struct Middle {
    inner: InnerMost;
    val: Int;
    ok: Bool?;
}

struct Outer {
    mid: Middle;
    addr: Address;
    flag: Bool;
}

contract TestContract {
    d: Outer;
    
    init() {
        self.d = Outer{
            mid: Middle{
                inner: InnerMost{
                    a: 0,
                    b: false,
                    c: null,
                },
                val: 2,
                ok: true,
            },
            addr: myAddress(),
            flag: true,
        };
    }

    receive() {
        self.d = self.d;
    }
}