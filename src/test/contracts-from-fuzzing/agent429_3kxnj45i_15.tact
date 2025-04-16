struct A {
    val: Int;
}

struct B {
    inner: A;
    flag: Bool;
}

contract UpdateStructField {
    st: B;
    init() {
        self.st = B{ inner: A{ val: 1 }, flag: true };
    }
    receive() {
        let temp = self.st;
        temp.inner.val = 42;  // test mutating inner struct field indirectly
        self.st = temp;
    }
}
