struct A {
    v: Int as int64;
}

contract AContract {
    a: A;
    init() {
        self.a = A{v:9223372036854775807};
    }
}