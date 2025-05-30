fun foo(_: Int): Int { 
    return 42;
}

contract Test {
    receive() { 
         foo(123);
    }
}
