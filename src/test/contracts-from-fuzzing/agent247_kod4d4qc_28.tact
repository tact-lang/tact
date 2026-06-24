struct A {
    opt: Bool?;
}

struct B {
    inner: A?;
}

contract OptOptTest {
    data: B;
    init() {
        self.data = B{ inner: null };
    }
}