struct A {
    m: Int;
}

struct B {
    a: A;
    n: Int?;
}

contract NestedNull {
    data: B?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = B{ a: A{m:2}, n:null };
    }
}