fun foo(a: Int) {}
fun foo2(b: Int,) {}
contract C {
    receive() { foo(1); foo2(2); }
}