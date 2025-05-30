message(1) M {
    x: Int;
}

struct Inner {
    m: M;
}

struct Middle {
    i: Inner;
}

struct Outer {
    m: Middle;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            m: Middle{
                i: Inner{
                    m: M{ x: 77 }
                }
            }
        };
    }
}