fun test(x: Int,): Int { return 123; }
contract X { receive() { test(1); } }