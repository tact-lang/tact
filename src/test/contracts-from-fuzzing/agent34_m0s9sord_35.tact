fun test(x: Int, y: Int): Int { return 1; } fun test2(x: Int, y: Int,): Int { return 2; }
contract X { receive() { test(1,2); test2(1,2); } }