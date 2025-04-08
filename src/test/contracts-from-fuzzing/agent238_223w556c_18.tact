struct A1 {
    b: A2;
}

struct A2 {
    c: A3;
}

struct A3 {
    d: A4;
}

struct A4 {
    e: A5;
}

struct A5 {
    val: Int;
}

contract Chain5 {
    ref: A1;

    init() {
        self.ref = A1{
            b: A2{
                c: A3{
                    d: A4{
                        e: A5{val: 123}
                    }
                }
            }
        };
    }
}