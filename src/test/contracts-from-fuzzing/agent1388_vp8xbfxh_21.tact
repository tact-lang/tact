struct B { foo: Int? = null; }

struct A { b: B? = null; }

contract Test {
    data: A = A{};
    get fun g(): A { return self.data; }
}
