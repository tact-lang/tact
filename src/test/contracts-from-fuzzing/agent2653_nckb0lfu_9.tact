struct A { val: Int }

contract TestContract {
    a: A;
    b: A?;
    c: A?;
    init() {
        self.a = A{val: 42};
        self.b = null;
        self.c = A{val: 7};
    }
}