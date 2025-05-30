struct Inner1 {
    a: Int;
}
struct Inner2 {
    a: Int;
}

struct Container {
    a: Inner1;
    b: Inner2;
    c: String?;
}

contract TestDupStructs {
    val: Container;
    init() {
        self.val = Container{
            a: Inner1{a:1},
            b: Inner2{a:2},
            c: null
        };
    }
}
