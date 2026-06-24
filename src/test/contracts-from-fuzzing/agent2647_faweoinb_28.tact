struct A {
    f1: Int;
    f2: Bool?;
}

contract AContract {
    a: A;

    init() {
        self.a = A{
            f1: 1,
            f2: null
        };
    }
}