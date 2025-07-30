struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
    i1: Inner1;
}

struct Inner3 {
    c: String;
    i2: Inner2;
}

struct Inner4 {
    d: Cell;
    i3: Inner3;
}

contract DeepNested {
    nested: Inner4;
    init() {
        self.nested = Inner4{
            d: emptyCell(),
            i3: Inner3{
                c: "nested",
                i2: Inner2{
                    b: true,
                    i1: Inner1{
                        a: 123
                    }
                }
            }
        };
    }
}