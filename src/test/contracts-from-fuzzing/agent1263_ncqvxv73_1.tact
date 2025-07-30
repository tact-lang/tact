struct A { foo: Int; }

contract Test {
    a: A;

    init() {
        self.a = A{foo: 1};
    }
}