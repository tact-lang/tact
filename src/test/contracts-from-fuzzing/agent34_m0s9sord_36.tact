fun test(x: Int, y: Int, z: Int,): Int { return x + y + z; }
contract X { receive() { test(1,2,3); } }