struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Inner1;
}

contract Test {
    nested: Inner2;

    init() {
        self.nested = Inner2{
            b: Inner1{
                a: 7
            }
        };
    }
}