struct Test {
    a: Int;
}

contract ReorderedFields {
    a: Int;
    b: Test;
    c: Int;

    init() {
        self.a = 1;
        self.b = Test{a: 2};
        self.c = 3;
    }
}