// mix bools & ints with default values
contract Test {
    a: Int = 1;
    b: Bool = false;
    c: Int = -5;
    d: Bool = true;
    receive() { let _=self.c; }
}