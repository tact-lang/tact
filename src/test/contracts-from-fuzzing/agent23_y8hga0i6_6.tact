const MY_CONST: Int = 42;

contract Test {
    receive() {
        let x: Int = MY_CONST;
    }
}
