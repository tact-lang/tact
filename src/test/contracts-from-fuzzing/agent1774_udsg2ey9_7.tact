struct List1 {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
}

struct List2 {
    b1: Int;
    b2: Int;
    b3: Int;
    b4: Int;
    b5: Int;
}

contract Test {
    l1: List1;
    l2: List2;

    init() {
        self.l1 = List1{
            a1: 1, a2: 2, a3: 3, a4: 4, a5: 5,
        };
        self.l2 = List2{
            b1: 6, b2: 7, b3: 8, b4: 9, b5: 10,
        };
    }
}