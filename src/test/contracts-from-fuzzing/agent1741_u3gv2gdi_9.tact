struct A { x: Int }
struct B { y: Int }

contract TestContract {
    a1: A; a2: A; a3: A;
    b1: B; b2: B; b3: B;

    init() {
        self.a1 = A{x: 1}; self.a2 = A{x: 2}; self.a3 = A{x: 3};
        self.b1 = B{y: 4}; self.b2 = B{y: 5}; self.b3 = B{y: 6};
    }
}