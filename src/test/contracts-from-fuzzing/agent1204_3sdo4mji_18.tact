struct A {
    x: Int;
    y: Bool;
}

struct B {
    s: String;
    a: A;
}

struct C {
    cell: Cell;
    b: B;
}

contract NestedABC {
    val: C;

    init() {
        self.val = C{
            cell: emptyCell(),
            b: B{
                s: "str",
                a: A{ x:5, y:false }
            }
        };
    }
}
