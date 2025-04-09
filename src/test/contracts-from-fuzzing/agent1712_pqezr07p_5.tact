struct Nested {
    u: Int = 7;
    v: Bool = false;
}

struct BigStruct {
    a: Int = 1;
    b: Bool = true;
    c: Address? = null;
    d: Int? = null;
    e: Nested? = null;
}

contract TestContract {
    stuff: BigStruct = BigStruct{
        a: 42,
        b: false,
        c: null,
        d: null,
        e: null,
    };

    init() {
        self.stuff = BigStruct{
            a: 100,
            b: true,
            c: null,
            d: 5,
            e: Nested{ u: 8, v: true },
        };
    }

    receive() {
        if (self.stuff.e != null) {
            let _ = self.stuff.e!!.u;
        }
    }
}