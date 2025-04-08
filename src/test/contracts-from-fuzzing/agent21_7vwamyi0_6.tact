struct A {
    xs: map<Int, Int>;
    opt: Int?;
}

struct B {
    inner: A;
}

contract Test {
    data: B;
    init() {
        self.data = B{inner: A{xs: emptyMap(), opt: null}};
    }
}