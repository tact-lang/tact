struct Simple {
    x: Int;
}

struct Wrap1 {
    s: Simple;
}

struct Wrap2 {
    w: Wrap1;
}

struct Wrap3 {
    w: Wrap2;
}

struct Wrap4 {
    w: Wrap3;
}

contract TestContract {
    nested: Wrap4;
    init() {
        self.nested = Wrap4{
            w: Wrap3{
                w: Wrap2{
                    w: Wrap1{
                        s: Simple{ x: 99 }
                    }
                }
            }
        };
    }
}