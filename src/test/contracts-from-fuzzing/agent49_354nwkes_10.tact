fun foo(contract: Int) {}

contract C {
    receive() {
        foo(1);
    }
}