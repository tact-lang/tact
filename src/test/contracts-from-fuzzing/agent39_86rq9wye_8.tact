const SUM: Int = 10 + 5;

contract TestSum {
    receive() {
         throwIf(100, SUM != 15);
    }
}
