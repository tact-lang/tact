struct CrossRef1 {
    a: Int;
    b: CrossRef2;
}

struct CrossRef2 {
    c: Int;
}

contract CrossStructs {
    s: CrossRef1;

    init() {
        self.s = CrossRef1{
            a: 1,
            b: CrossRef2{c:2}
        };
    }
}
