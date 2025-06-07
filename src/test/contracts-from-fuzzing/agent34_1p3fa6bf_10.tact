struct Inner {
    a: Int?;
}

struct Middle {
    i: Inner?;
}

struct Outer {
    m: Middle?;
}

contract Test9 {
    o: Outer;
    init() {
        self.o = Outer { m: Middle { i: Inner { a: null } } };
    }
}