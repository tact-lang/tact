fun test(x: Int, y: Int,): Int { return 1; }
contract X { receive() { test(1,2); } }