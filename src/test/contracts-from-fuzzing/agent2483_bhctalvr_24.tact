fun mul2(x: Int): Int { return x * 2; }
fun add4(x: Int): Int { return mul2(x) + mul2(x); }

contract TestContract {
    val: Int = add4(5);
    receive() { add4(3); }
}