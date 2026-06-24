struct A { x: Int }
struct B { y: Int }

contract X {
    s: A;
    t: B;

    init() {
        self.s = A{x:1};
        self.t = B{y:2};
    }
}