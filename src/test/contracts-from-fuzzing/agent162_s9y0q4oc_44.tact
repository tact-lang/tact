struct A {
    x: Int as uint4;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{ x: 12 };
    }
}