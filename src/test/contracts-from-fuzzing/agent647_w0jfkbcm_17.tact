// Persistent state variables with default value that is not a literal
contract InitExprFields {
    a: Int = 1 + 1;
    b: Int = (2 * 3) + (4 - 1);
    c: Int = pow(2, 8);

    init() {
        // override
        self.a = 42;
        self.b = 777;
        self.c = 1234;
    }
}