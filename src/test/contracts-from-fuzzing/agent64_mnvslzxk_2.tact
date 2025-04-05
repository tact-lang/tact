const MY_CONST: Int = 5;

contract TestContract {
    receive() {
        let a: Int = MY_CONST + 1;
        dump(a);
    }
}
