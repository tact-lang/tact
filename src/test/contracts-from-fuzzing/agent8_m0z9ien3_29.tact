asm fun push42(): Int { 42 INT }

contract TestPush42 {
    fun test(): Int {
         return push42();
    }
}
