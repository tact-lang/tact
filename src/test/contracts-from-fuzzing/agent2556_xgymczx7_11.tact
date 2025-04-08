struct Outer1 {
    a: Int;
    b: Inner1;
}

struct Inner1 {
    c: Int;
    d: Inner2;
}

struct Inner2 {
    e: Int;
    f: Inner3;
}

struct Inner3 {
    g: Int;
}

contract MultiInnerContract {
    data: Outer1;

    init() {
        self.data = Outer1{
            a: 1,
            b: Inner1{
                c: 2,
                d: Inner2 {
                    e: 3,
                    f: Inner3 {
                        g: 4
                    }
                }
            }
        };
    }
}
