struct Tens {
    a: Int;
    b: Int;
    c: Int;
}

struct Outer {
    f1: Tens;
    f2: Tens;
}

contract RepeatStructs {
    nested: Outer;

    init() {
        self.nested = Outer{
            f1: Tens{ a:1,b:2,c:3 },
            f2: Tens{ a:4,b:5,c:6 }
        };
    }
}