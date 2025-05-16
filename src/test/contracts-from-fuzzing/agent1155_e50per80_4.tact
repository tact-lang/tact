struct Base {
    a: Int;
    b: Bool;
}

struct Middle {
    base: Base;
    c: Cell;
    d: String;
}

struct Outer {
    middle: Middle;
    e: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                base: Base{
                    a: 1,
                    b: true
                },
                c: emptyCell(),
                d: "middle"
            },
            e: "outer"
        };
    }
}
