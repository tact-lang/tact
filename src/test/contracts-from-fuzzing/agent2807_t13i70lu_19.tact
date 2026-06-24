message(11) M { val: Int }
struct P { foo: Int }

contract OptComplex {
    m: M?;
    i: Int?;
    p: P?;

    init() {
        self.m = null;
        self.i = null;
        self.p = null;
    }
}