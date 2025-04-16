struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Int;
}

struct Outer {
    f1: Inner1;
    f2: Int;
    f3: Inner2;
    f4: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            f1: Inner1{x:1},
            f2: 2,
            f3: Inner2{y:3},
            f4: 4,
        };
    }
}