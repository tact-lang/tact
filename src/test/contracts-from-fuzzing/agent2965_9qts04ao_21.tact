struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Bool;
}

struct Outer {
    f1: Inner1;
    f2: Inner2;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            f1: Inner1{x: 1},
            f2: Inner2{y: false}
        };
    }
}
