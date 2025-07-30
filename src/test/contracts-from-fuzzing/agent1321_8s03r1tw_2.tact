struct B {
    foo: Int;
    bar: Int;
}

contract OptTest {
    data: B?;
    init() {
        self.data = null;
    }
}