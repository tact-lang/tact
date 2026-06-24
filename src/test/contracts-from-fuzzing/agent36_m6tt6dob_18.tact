struct SA { a: Int }
struct SB { b: Int }
struct SC { c: Int }

struct Container {
    sa: SA;
    sb: SB;
    sc: SC;
}

contract MultiStructContainer {
    all: Container;
    init() {
        self.all = Container{
            sa: SA{a:1},
            sb: SB{b:2},
            sc: SC{c:3}
        };
    }
}