struct RecursionA {
    tag: Int;
}

contract RecursiveHolder {
    field: RecursionA;
    another: Int;

    init() {
        self.field = RecursionA{tag: 0};
        self.another = 1;
    }
}