struct Inner1 { a: Int }
struct Inner2 { a: Int }

contract MultiTypes {
    s1: Inner1;
    s2: Inner2;

    init() {
        self.s1 = Inner1{a:1};
        self.s2 = Inner2{a:2};
    }
}