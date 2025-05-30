fun f( extends: Int ): Int { return extends; }

contract C { receive() { f(5); } }