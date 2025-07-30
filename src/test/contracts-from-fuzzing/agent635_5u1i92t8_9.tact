struct Inner1 {
    x: Int
}

struct Inner2 {
    x: Int
}

struct Inner3 {
    x: Int
}

struct Outer {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract MultiNested {
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner1{ x: 11 },
            b: Inner2{ x: 22 },
            c: Inner3{ x: 33 }
        };
    }
}