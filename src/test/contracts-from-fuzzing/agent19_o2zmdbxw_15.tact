fun myFunc(a: Int, ) {
    return;
}

contract C {
    receive() { myFunc(5); }
}