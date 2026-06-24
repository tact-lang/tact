struct A { val: Int }
struct B { val: Int }
struct C { val: Int }

struct ABC { a: A; b: B; c: C }

contract TestContract {
    data: ABC;

    init() {
        self.data = ABC{ a: A{ val: 1 }, b: B{ val: 2 }, c: C{ val: 3 } };
    }
}