fun test_expr() {
   1 + 2;
}

contract TestContract {
    receive() {
       test_expr();
    }
}
