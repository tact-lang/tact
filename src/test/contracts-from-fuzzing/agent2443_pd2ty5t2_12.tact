struct A { a: Int }
struct B { b: Int }

struct Both {
    a: A?;
    b: B?;
}

contract TestContract {
    complex: Both;
    init() {
        self.complex = Both{ a: null, b: null };
    }
}