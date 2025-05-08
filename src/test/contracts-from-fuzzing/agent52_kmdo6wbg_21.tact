contract OperatorTest {
    receive() {
        let a: Int = 42;
        // applying bitwise operations: & then |, then ^
        let b: Int = (a & 15) | (2 ^ 3);
        dump(b);
    }
}
