asm fun push42(): Int { 42 PUSHINT }

contract TestPush42 {
    receive() {}

    fun test(): Int {
        return push42();
    }
}
