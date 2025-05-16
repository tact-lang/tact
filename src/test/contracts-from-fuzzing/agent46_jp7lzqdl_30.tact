struct A { value: Int }

struct B { inner: A }

struct C { inner: B }

contract DeepNest {
    data: C;

    init() {
        self.data = C{ inner: B{ inner: A{ value: 777 } } };
    }
}
