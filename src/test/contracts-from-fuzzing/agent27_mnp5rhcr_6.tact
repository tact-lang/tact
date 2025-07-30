fun foo(_: Int): Int { 
    // Valid: underscore parameter is discarded and not accessed
    return 55;
}

contract Test {
    receive() {
         let res: Int = foo(10);
         dump(res);
    }
}
