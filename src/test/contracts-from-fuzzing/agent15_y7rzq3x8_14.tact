struct A { v: Int; }
struct B { a: A; val: String; }

contract TestContract {
    a1: A;
    b1: B;

    init() {
        self.a1 = A{ v: 9 };
        self.b1 = B{ a: self.a1, val: "test" };
    }
    
    receive() {
        self.a1 = A{ v: 111 };
        self.b1 = B{ a: self.a1, val: "updated" };
    }
}