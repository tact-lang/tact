struct Mid1 { a: Int }
struct Mid2 { b: Int }

struct Top {
    m1: Mid1;
    m2: Mid2;
}

contract TestContract {
    top: Top;

    init() {
        self.top = Top{ m1: Mid1{a:1}, m2: Mid2{b:2} };
    }
}