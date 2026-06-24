fun foo(a: Int, ): Int { return a; }

contract Test { receive() { foo(1); } }