struct S {
    a: Int = 42;
}

fun testS(s: S): Int {
    return s.a;
}

contract TestSContract {
    receive() {
        testS(S{});
    }
}
