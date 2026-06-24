struct Middle {
    c: Int;
    d: Bool;
}

struct Outer {
    a: Int;
    b: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 10,
            b: Middle{c: 20, d: true}
        };
    }
}