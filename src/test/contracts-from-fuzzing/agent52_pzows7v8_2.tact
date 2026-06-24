const A: Int = 123;

contract TestConstGlobal {
    receive() {
        let x: Int = A;
    }
}
