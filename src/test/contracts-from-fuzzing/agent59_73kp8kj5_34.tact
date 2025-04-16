struct First {
    a: Int;
}

struct Second {
    b: Int;
    c: First;
}

struct Third {
    d: Int;
    e: Second;
}

contract ChainStructs {
    val: Third;

    init() {
        self.val = Third {
            d: 1,
            e: Second {
                b: 2,
                c: First { a: 3 }
            }
        };
    }
}
