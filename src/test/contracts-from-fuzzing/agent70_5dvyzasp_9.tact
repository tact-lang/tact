struct A {
    a: Int;
    b: Bool;
}

struct B {
    c: A;
    d: String;
    e: Int?;
    f: Bool?;
    g: Cell;
}

contract X {
    my: B;

    init() {
        self.my = B{
            c: A{a:1, b:true},
            d: "abc",
            e: null,
            f: null,
            g: emptyCell()
        };
    }
}