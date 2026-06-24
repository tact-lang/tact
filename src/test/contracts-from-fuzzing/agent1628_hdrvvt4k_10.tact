struct Deep {
    a: Int;
    b: Bool;
    c: Deeper;
}

struct Deeper {
    x: Int;
    y: Deepest;
}

struct Deepest {
    val: Bool?;
}

contract TestContract {
    nested: Deep;
    init() {
        self.nested = Deep{
            a: 10,
            b: true,
            c: Deeper{
                x: 20,
                y: Deepest{
                    val: false
                }
            }
        };
    }
}