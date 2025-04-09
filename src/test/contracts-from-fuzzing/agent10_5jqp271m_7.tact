fun foo(
    ) {
    return;
}

contract Test {
    receive() {
        foo();
    }
}