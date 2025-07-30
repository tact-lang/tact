struct Inner1 { i: Int }
struct Inner2 { j: Bool }

struct Middle {
    a: Inner1;
    b: Inner2;
}

struct Outer {
    c: Middle;
    d: String;
}

contract MultiNested {
    state: Outer;

    init() {
        self.state = Outer {
            c: Middle{
                a: Inner1{ i: 42 },
                b: Inner2{ j: true }
            },
            d: "x"
        };
    }
}
