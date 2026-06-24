fun fun_unused(_ : Int) { }

contract Test {
    receive() {
        fun_unused(123);
    }
}
