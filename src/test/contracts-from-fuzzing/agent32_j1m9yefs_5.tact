fun getOne(): Int { return 1; }

contract TestExprStatement {
    receive() {
         getOne(); // expression statement; result discarded
         dump(1);
    }
}
