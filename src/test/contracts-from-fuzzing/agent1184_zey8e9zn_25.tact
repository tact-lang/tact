struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

contract Nest2 {
    c: S2;

    init() {
        self.c = S2{
            b: S1{
                a: 111
            }
        };
    }
}