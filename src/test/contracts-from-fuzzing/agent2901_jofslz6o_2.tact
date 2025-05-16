struct A {
    value: Int?;
}

contract Test {
    data: A;

    init() {
        self.data = A{value: null};
    }
}