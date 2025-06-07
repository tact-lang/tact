struct Inner1 {
    a: Int;
}

struct Inner2 {
    i1: Inner1;
}

struct Inner3 {
    i2: Inner2;
}

contract TestContract {
    data: Inner3;

    init() {
        self.data = Inner3{
            i2: Inner2{
                i1: Inner1{
                    a: 123
                }
            }
        };
    }
}