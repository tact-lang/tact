fun funfun(): Int {
    return 1;
}

contract Test {
    receive() { funfun(); }
}