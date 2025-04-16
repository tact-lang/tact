struct A {
    x: Int;
}

contract AssignLate {
    foo: A;

    init() {
        let tmp = A{ x:99 };
        self.foo = tmp;
    }
}