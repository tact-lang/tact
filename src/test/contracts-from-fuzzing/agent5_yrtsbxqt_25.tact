inline

fun test(): Int {
    return 1;
}

contract Test {
    receive() { test(); }
}