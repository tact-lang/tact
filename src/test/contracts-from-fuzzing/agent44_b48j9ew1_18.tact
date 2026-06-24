struct A { val: Int; }
struct B { val: Int; }

contract DiffStructs {
    sa: A;
    sb: B;

    init() {
        self.sa = A{ val: 5 };
        self.sb = B{ val: 10 };
    }

    receive() {
        self.sa = A{ val: 6 };
    }
}