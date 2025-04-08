struct Inner1 { val: Int; }
struct Inner2 { val: Int; }
struct Inner3 { val: Int; }
struct Inner4 { val: Int; }

struct Outer {
    a: Inner1;
    b: Inner2;
    c: Inner3;
    d: Inner4;
}

contract WideStruct {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner1{ val: 1 },
            b: Inner2{ val: 2 },
            c: Inner3{ val: 3 },
            d: Inner4{ val: 4 },
        };
    }
}