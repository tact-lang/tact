struct First {
    a: Int;
}

struct Second {
    b: Int;
    c: First;
}

struct Third {
    d: Bool;
    e: Second;
}

contract HighlyNested {
    val: Third;

    init() {
        self.val = Third{
            d:true,
            e: Second{
                b:3,
                c: First{ a:5 }
            }
        };
    }
}
