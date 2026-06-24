struct A { x: Int }
struct B { y: Int }

contract StructSwap {
    a: A;
    b: B;

    init() {
        self.a = A{x:1};
        self.b = B{y:2};
        self.a = A{x:3};
    }
}