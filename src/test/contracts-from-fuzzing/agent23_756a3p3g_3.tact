fun f(a: Int, b: Int,) : Int { 
    return a + b; 
}

contract C {
    receive() {
        f(1, 2);
    }
}
