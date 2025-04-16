fun foo(a: 
Int): Int {
    return 0;
}

contract A {
    receive() {
        foo(1);
    }
}
