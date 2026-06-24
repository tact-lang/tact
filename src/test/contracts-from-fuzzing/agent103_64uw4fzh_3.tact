struct A {
    n: Int;
    flag: Bool;
}

struct B {
    inner: A;
    msg: String;
}

contract TestContract {
    b: B;

    init() {
        self.b = B{ inner: A{ n: 5, flag: true }, msg: "hello" };
    }
}
